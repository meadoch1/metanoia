defmodule Metanoia.DenominationControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Denomination
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, denomination_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    denomination = Repo.insert! %Denomination{}
    conn = get conn, denomination_path(conn, :show, denomination)
    assert json_response(conn, 200)["data"] == %{"id" => denomination.id,
      "name" => denomination.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, denomination_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, denomination_path(conn, :create), denomination: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Denomination, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, denomination_path(conn, :create), denomination: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    denomination = Repo.insert! %Denomination{}
    conn = put conn, denomination_path(conn, :update, denomination), denomination: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Denomination, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    denomination = Repo.insert! %Denomination{}
    conn = put conn, denomination_path(conn, :update, denomination), denomination: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    denomination = Repo.insert! %Denomination{}
    conn = delete conn, denomination_path(conn, :delete, denomination)
    assert response(conn, 204)
    refute Repo.get(Denomination, denomination.id)
  end
end
