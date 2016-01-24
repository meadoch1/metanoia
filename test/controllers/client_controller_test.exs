defmodule Metanoia.ClientControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Client
  @valid_attrs %{earliest_out_dt: "2010-04-17", facility_address_text: "some content", facility_ref_cd: "some content", grader_address_text: "some content", max_possible_release_dt: "2010-04-17", note: "some content", tentative_parole_month: "2010-04-17"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = get conn, client_path(conn, :show, client)
    assert json_response(conn, 200)["data"] == %{"id" => client.id,
      "person_id" => client.person_id,
      "facility_id" => client.facility_id,
      "facility_ref_cd" => client.facility_ref_cd,
      "earliest_out_dt" => client.earliest_out_dt,
      "client_status_id" => client.client_status_id,
      "note" => client.note,
      "facility_address_text" => client.facility_address_text,
      "grader_address_text" => client.grader_address_text,
      "parole_status_id" => client.parole_status_id,
      "tentative_parole_month" => client.tentative_parole_month,
      "max_possible_release_dt" => client.max_possible_release_dt}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, client_path(conn, :create), client: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Client, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_path(conn, :create), client: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = put conn, client_path(conn, :update, client), client: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Client, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = put conn, client_path(conn, :update, client), client: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = delete conn, client_path(conn, :delete, client)
    assert response(conn, 204)
    refute Repo.get(Client, client.id)
  end
end
