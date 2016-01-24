defmodule Metanoia.ClientCommunicationTypeControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.ClientCommunicationType
  @valid_attrs %{contents: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_communication_type_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    client_communication_type = Repo.insert! %ClientCommunicationType{}
    conn = get conn, client_communication_type_path(conn, :show, client_communication_type)
    assert json_response(conn, 200)["data"] == %{"id" => client_communication_type.id,
      "name" => client_communication_type.name,
      "contents" => client_communication_type.contents}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_communication_type_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, client_communication_type_path(conn, :create), client_communication_type: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ClientCommunicationType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_communication_type_path(conn, :create), client_communication_type: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    client_communication_type = Repo.insert! %ClientCommunicationType{}
    conn = put conn, client_communication_type_path(conn, :update, client_communication_type), client_communication_type: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ClientCommunicationType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client_communication_type = Repo.insert! %ClientCommunicationType{}
    conn = put conn, client_communication_type_path(conn, :update, client_communication_type), client_communication_type: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    client_communication_type = Repo.insert! %ClientCommunicationType{}
    conn = delete conn, client_communication_type_path(conn, :delete, client_communication_type)
    assert response(conn, 204)
    refute Repo.get(ClientCommunicationType, client_communication_type.id)
  end
end
