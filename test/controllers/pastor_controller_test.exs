defmodule Metanoia.PastorControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Pastor
  @valid_attrs %{is_head: true, is_primary: true}
  @invalid_attrs %{is_head: "foo"}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pastor_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    pastor = Repo.insert! %Pastor{}
    conn = get conn, pastor_path(conn, :show, pastor)
    assert json_response(conn, 200)["data"] == %{"id" => pastor.id,
      "person_id" => pastor.person_id,
      "is_primary" => pastor.is_primary,
      "is_head" => pastor.is_head}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pastor_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, pastor_path(conn, :create), pastor: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Pastor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pastor_path(conn, :create), pastor: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    pastor = Repo.insert! %Pastor{}
    conn = put conn, pastor_path(conn, :update, pastor), pastor: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Pastor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pastor = Repo.insert! %Pastor{}
    conn = put conn, pastor_path(conn, :update, pastor), pastor: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    pastor = Repo.insert! %Pastor{}
    conn = delete conn, pastor_path(conn, :delete, pastor)
    assert response(conn, 204)
    refute Repo.get(Pastor, pastor.id)
  end
end
