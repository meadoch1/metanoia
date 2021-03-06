defmodule Metanoia.RelationshipPreferenceControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.RelationshipPreference
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, relationship_preference_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    relationship_preference = Repo.insert! %RelationshipPreference{}
    conn = get conn, relationship_preference_path(conn, :show, relationship_preference)
    assert json_response(conn, 200)["data"] == %{"id" => relationship_preference.id,
      "name" => relationship_preference.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, relationship_preference_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, relationship_preference_path(conn, :create), relationship_preference: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(RelationshipPreference, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, relationship_preference_path(conn, :create), relationship_preference: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    relationship_preference = Repo.insert! %RelationshipPreference{}
    conn = put conn, relationship_preference_path(conn, :update, relationship_preference), relationship_preference: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(RelationshipPreference, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    relationship_preference = Repo.insert! %RelationshipPreference{}
    conn = put conn, relationship_preference_path(conn, :update, relationship_preference), relationship_preference: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    relationship_preference = Repo.insert! %RelationshipPreference{}
    conn = delete conn, relationship_preference_path(conn, :delete, relationship_preference)
    assert response(conn, 204)
    refute Repo.get(RelationshipPreference, relationship_preference.id)
  end
end
