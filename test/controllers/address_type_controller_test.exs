defmodule Metanoia.AddressTypeControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.AddressType
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, address_type_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    address_type = Repo.insert! %AddressType{}
    conn = get conn, address_type_path(conn, :show, address_type)
    assert json_response(conn, 200)["data"] == %{"id" => address_type.id,
      "name" => address_type.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, address_type_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, address_type_path(conn, :create), address_type: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(AddressType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, address_type_path(conn, :create), address_type: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    address_type = Repo.insert! %AddressType{}
    conn = put conn, address_type_path(conn, :update, address_type), address_type: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(AddressType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    address_type = Repo.insert! %AddressType{}
    conn = put conn, address_type_path(conn, :update, address_type), address_type: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    address_type = Repo.insert! %AddressType{}
    conn = delete conn, address_type_path(conn, :delete, address_type)
    assert response(conn, 204)
    refute Repo.get(AddressType, address_type.id)
  end
end
