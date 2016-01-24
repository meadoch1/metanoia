defmodule Metanoia.VolunteerStatusControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.VolunteerStatus
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, volunteer_status_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    volunteer_status = Repo.insert! %VolunteerStatus{}
    conn = get conn, volunteer_status_path(conn, :show, volunteer_status)
    assert json_response(conn, 200)["data"] == %{"id" => volunteer_status.id,
      "name" => volunteer_status.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, volunteer_status_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, volunteer_status_path(conn, :create), volunteer_status: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(VolunteerStatus, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, volunteer_status_path(conn, :create), volunteer_status: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    volunteer_status = Repo.insert! %VolunteerStatus{}
    conn = put conn, volunteer_status_path(conn, :update, volunteer_status), volunteer_status: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(VolunteerStatus, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    volunteer_status = Repo.insert! %VolunteerStatus{}
    conn = put conn, volunteer_status_path(conn, :update, volunteer_status), volunteer_status: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    volunteer_status = Repo.insert! %VolunteerStatus{}
    conn = delete conn, volunteer_status_path(conn, :delete, volunteer_status)
    assert response(conn, 204)
    refute Repo.get(VolunteerStatus, volunteer_status.id)
  end
end
