defmodule Metanoia.ClientStatusControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.ClientStatus
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_status_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    client_status = Repo.insert! %ClientStatus{}
    conn = get conn, client_status_path(conn, :show, client_status)
    assert json_response(conn, 200)["data"] == %{"id" => client_status.id,
      "name" => client_status.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_status_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, client_status_path(conn, :create), client_status: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ClientStatus, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_status_path(conn, :create), client_status: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    client_status = Repo.insert! %ClientStatus{}
    conn = put conn, client_status_path(conn, :update, client_status), client_status: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ClientStatus, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client_status = Repo.insert! %ClientStatus{}
    conn = put conn, client_status_path(conn, :update, client_status), client_status: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    client_status = Repo.insert! %ClientStatus{}
    conn = delete conn, client_status_path(conn, :delete, client_status)
    assert response(conn, 204)
    refute Repo.get(ClientStatus, client_status.id)
  end
end
