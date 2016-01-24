defmodule Metanoia.PresbyteryControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Presbytery
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, presbytery_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    presbytery = Repo.insert! %Presbytery{}
    conn = get conn, presbytery_path(conn, :show, presbytery)
    assert json_response(conn, 200)["data"] == %{"id" => presbytery.id,
      "name" => presbytery.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, presbytery_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, presbytery_path(conn, :create), presbytery: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Presbytery, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, presbytery_path(conn, :create), presbytery: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    presbytery = Repo.insert! %Presbytery{}
    conn = put conn, presbytery_path(conn, :update, presbytery), presbytery: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Presbytery, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    presbytery = Repo.insert! %Presbytery{}
    conn = put conn, presbytery_path(conn, :update, presbytery), presbytery: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    presbytery = Repo.insert! %Presbytery{}
    conn = delete conn, presbytery_path(conn, :delete, presbytery)
    assert response(conn, 204)
    refute Repo.get(Presbytery, presbytery.id)
  end
end
