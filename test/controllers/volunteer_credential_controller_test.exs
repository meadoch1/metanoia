defmodule Metanoia.VolunteerCredentialControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.VolunteerCredential
  @valid_attrs %{comment: "some content", credential_cd: "some content", expiration_dt: "2010-04-17"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, volunteer_credential_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    volunteer_credential = Repo.insert! %VolunteerCredential{}
    conn = get conn, volunteer_credential_path(conn, :show, volunteer_credential)
    assert json_response(conn, 200)["data"] == %{"id" => volunteer_credential.id,
      "credential_cd" => volunteer_credential.credential_cd,
      "expiration_dt" => volunteer_credential.expiration_dt,
      "comment" => volunteer_credential.comment,
      "volunteer_id" => volunteer_credential.volunteer_id,
      "facility_id" => volunteer_credential.facility_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, volunteer_credential_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, volunteer_credential_path(conn, :create), volunteer_credential: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(VolunteerCredential, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, volunteer_credential_path(conn, :create), volunteer_credential: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    volunteer_credential = Repo.insert! %VolunteerCredential{}
    conn = put conn, volunteer_credential_path(conn, :update, volunteer_credential), volunteer_credential: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(VolunteerCredential, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    volunteer_credential = Repo.insert! %VolunteerCredential{}
    conn = put conn, volunteer_credential_path(conn, :update, volunteer_credential), volunteer_credential: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    volunteer_credential = Repo.insert! %VolunteerCredential{}
    conn = delete conn, volunteer_credential_path(conn, :delete, volunteer_credential)
    assert response(conn, 204)
    refute Repo.get(VolunteerCredential, volunteer_credential.id)
  end
end
