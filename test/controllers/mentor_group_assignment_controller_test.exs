defmodule Metanoia.MentorGroupAssignmentControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.MentorGroupAssignment
  @valid_attrs %{comments: "some content", start_month: "2010-04-17"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mentor_group_assignment_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    mentor_group_assignment = Repo.insert! %MentorGroupAssignment{}
    conn = get conn, mentor_group_assignment_path(conn, :show, mentor_group_assignment)
    assert json_response(conn, 200)["data"] == %{"id" => mentor_group_assignment.id,
      "mentor_group_id" => mentor_group_assignment.mentor_group_id,
      "volunteer_id" => mentor_group_assignment.volunteer_id,
      "comments" => mentor_group_assignment.comments,
      "start_month" => mentor_group_assignment.start_month}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mentor_group_assignment_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, mentor_group_assignment_path(conn, :create), mentor_group_assignment: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(MentorGroupAssignment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mentor_group_assignment_path(conn, :create), mentor_group_assignment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    mentor_group_assignment = Repo.insert! %MentorGroupAssignment{}
    conn = put conn, mentor_group_assignment_path(conn, :update, mentor_group_assignment), mentor_group_assignment: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(MentorGroupAssignment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mentor_group_assignment = Repo.insert! %MentorGroupAssignment{}
    conn = put conn, mentor_group_assignment_path(conn, :update, mentor_group_assignment), mentor_group_assignment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    mentor_group_assignment = Repo.insert! %MentorGroupAssignment{}
    conn = delete conn, mentor_group_assignment_path(conn, :delete, mentor_group_assignment)
    assert response(conn, 204)
    refute Repo.get(MentorGroupAssignment, mentor_group_assignment.id)
  end
end
