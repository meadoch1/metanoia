defmodule Metanoia.SecurityLevelControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.SecurityLevel
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, security_level_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    security_level = Repo.insert! %SecurityLevel{}
    conn = get conn, security_level_path(conn, :show, security_level)
    assert json_response(conn, 200)["data"] == %{"id" => security_level.id,
      "name" => security_level.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, security_level_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, security_level_path(conn, :create), security_level: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(SecurityLevel, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, security_level_path(conn, :create), security_level: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    security_level = Repo.insert! %SecurityLevel{}
    conn = put conn, security_level_path(conn, :update, security_level), security_level: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(SecurityLevel, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    security_level = Repo.insert! %SecurityLevel{}
    conn = put conn, security_level_path(conn, :update, security_level), security_level: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    security_level = Repo.insert! %SecurityLevel{}
    conn = delete conn, security_level_path(conn, :delete, security_level)
    assert response(conn, 204)
    refute Repo.get(SecurityLevel, security_level.id)
  end
end
