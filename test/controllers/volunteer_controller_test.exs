defmodule Metanoia.VolunteerControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Volunteer
  @valid_attrs %{mna_second_career: true, note: "some content"}
  @invalid_attrs %{mna_second_career: 'foo'}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, volunteer_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    volunteer = Repo.insert! %Volunteer{}
    conn = get conn, volunteer_path(conn, :show, volunteer)
    assert json_response(conn, 200)["data"] == %{"id" => volunteer.id,
      "person_id" => volunteer.person_id,
      "volunteer_status_id" => volunteer.volunteer_status_id,
      "relationship_preference_id" => volunteer.relationship_preference_id,
      "mna_second_career" => volunteer.mna_second_career,
      "note" => volunteer.note}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, volunteer_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, volunteer_path(conn, :create), volunteer: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Volunteer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, volunteer_path(conn, :create), volunteer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    volunteer = Repo.insert! %Volunteer{}
    conn = put conn, volunteer_path(conn, :update, volunteer), volunteer: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Volunteer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    volunteer = Repo.insert! %Volunteer{}
    conn = put conn, volunteer_path(conn, :update, volunteer), volunteer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    volunteer = Repo.insert! %Volunteer{}
    conn = delete conn, volunteer_path(conn, :delete, volunteer)
    assert response(conn, 204)
    refute Repo.get(Volunteer, volunteer.id)
  end
end
