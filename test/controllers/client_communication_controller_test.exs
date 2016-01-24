defmodule Metanoia.ClientCommunicationControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.ClientCommunication
  @valid_attrs %{note: "some content", sent_dt: "2010-04-17"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_communication_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    client_communication = Repo.insert! %ClientCommunication{}
    conn = get conn, client_communication_path(conn, :show, client_communication)
    assert json_response(conn, 200)["data"] == %{"id" => client_communication.id,
      "client_id" => client_communication.client_id,
      "client_communication_type_id" => client_communication.client_communication_type_id,
      "sent_dt" => client_communication.sent_dt,
      "note" => client_communication.note}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_communication_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, client_communication_path(conn, :create), client_communication: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ClientCommunication, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_communication_path(conn, :create), client_communication: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    client_communication = Repo.insert! %ClientCommunication{}
    conn = put conn, client_communication_path(conn, :update, client_communication), client_communication: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ClientCommunication, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client_communication = Repo.insert! %ClientCommunication{}
    conn = put conn, client_communication_path(conn, :update, client_communication), client_communication: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    client_communication = Repo.insert! %ClientCommunication{}
    conn = delete conn, client_communication_path(conn, :delete, client_communication)
    assert response(conn, 204)
    refute Repo.get(ClientCommunication, client_communication.id)
  end
end
