defmodule Metanoia.ClientVolunteerAssignmentControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.ClientVolunteerAssignment
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_volunteer_assignment_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    client_volunteer_assignment = Repo.insert! %ClientVolunteerAssignment{}
    conn = get conn, client_volunteer_assignment_path(conn, :show, client_volunteer_assignment)
    assert json_response(conn, 200)["data"] == %{"id" => client_volunteer_assignment.id,
      "client_id" => client_volunteer_assignment.client_id,
      "program_id" => client_volunteer_assignment.program_id,
      "volunteer_id" => client_volunteer_assignment.volunteer_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_volunteer_assignment_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, client_volunteer_assignment_path(conn, :create), client_volunteer_assignment: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ClientVolunteerAssignment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_volunteer_assignment_path(conn, :create), client_volunteer_assignment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    client_volunteer_assignment = Repo.insert! %ClientVolunteerAssignment{}
    conn = put conn, client_volunteer_assignment_path(conn, :update, client_volunteer_assignment), client_volunteer_assignment: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ClientVolunteerAssignment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client_volunteer_assignment = Repo.insert! %ClientVolunteerAssignment{}
    conn = put conn, client_volunteer_assignment_path(conn, :update, client_volunteer_assignment), client_volunteer_assignment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    client_volunteer_assignment = Repo.insert! %ClientVolunteerAssignment{}
    conn = delete conn, client_volunteer_assignment_path(conn, :delete, client_volunteer_assignment)
    assert response(conn, 204)
    refute Repo.get(ClientVolunteerAssignment, client_volunteer_assignment.id)
  end
end
