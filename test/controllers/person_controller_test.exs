defmodule Metanoia.PersonControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Person
  @valid_attrs %{dob: "2010-04-17", email: "some content", email2: "some content", first_name: "some content", last_name: "some content", middle_name: "some content", mobile_phone: "some content", nickname: "some content", phone: "some content", spouse_name: "some content", suffix: "some content", work_phone: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, person_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = get conn, person_path(conn, :show, person)
    assert json_response(conn, 200)["data"] == %{"id" => person.id,
      "first_name" => person.first_name,
      "last_name" => person.last_name,
      "middle_name" => person.middle_name,
      "address_id" => person.address_id,
      "phone" => person.phone,
      "mobile_phone" => person.mobile_phone,
      "email" => person.email,
      "church_id" => person.church_id,
      "pastor_id" => person.pastor_id,
      "dob" => person.dob,
      "pastor_id" => person.pastor_id,
      "work_phone" => person.work_phone,
      "spouse_name" => person.spouse_name,
      "email2" => person.email2,
      "nickname" => person.nickname,
      "suffix" => person.suffix}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, person_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, person_path(conn, :create), person: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Person, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, person_path(conn, :create), person: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = put conn, person_path(conn, :update, person), person: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Person, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = put conn, person_path(conn, :update, person), person: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = delete conn, person_path(conn, :delete, person)
    assert response(conn, 204)
    refute Repo.get(Person, person.id)
  end
end
