defmodule Metanoia.MentorGroupControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.MentorGroup
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{name: 1}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mentor_group_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    mentor_group = Repo.insert! %MentorGroup{}
    conn = get conn, mentor_group_path(conn, :show, mentor_group)
    assert json_response(conn, 200)["data"] == %{"id" => mentor_group.id,
      "name" => mentor_group.name,
      "leader_id" => mentor_group.leader_id,
      "facility_id" => mentor_group.facility_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mentor_group_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    facility = Repo.insert! %Metanoia.Facility{}
    attrs = @valid_attrs |> Map.put(:facility_id, facility.id)
    conn = post conn, mentor_group_path(conn, :create), mentor_group: attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(MentorGroup, attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mentor_group_path(conn, :create), mentor_group: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    facility = Repo.insert! %Metanoia.Facility{}
    mentor_group = Repo.insert! %MentorGroup{}
    attrs = @valid_attrs |> Map.put(:facility_id, facility.id)
    conn = put conn, mentor_group_path(conn, :update, mentor_group), mentor_group: attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(MentorGroup, attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mentor_group = Repo.insert! %MentorGroup{}
    conn = put conn, mentor_group_path(conn, :update, mentor_group), mentor_group: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    mentor_group = Repo.insert! %MentorGroup{}
    conn = delete conn, mentor_group_path(conn, :delete, mentor_group)
    assert response(conn, 204)
    refute Repo.get(MentorGroup, mentor_group.id)
  end
end
