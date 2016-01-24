defmodule Metanoia.FacilityControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Facility
  @valid_attrs %{avg_daily_pop: 42, courier: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, facility_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    facility = Repo.insert! %Facility{}
    conn = get conn, facility_path(conn, :show, facility)
    assert json_response(conn, 200)["data"] == %{"id" => facility.id,
      "name" => facility.name,
      "address_id" => facility.address_id,
      "courier" => facility.courier,
      "warden_id" => facility.warden_id,
      "chaplain_id" => facility.chaplain_id,
      "jurisdiction_id" => facility.jurisdiction_id,
      "security_level_id" => facility.security_level_id,
      "avg_daily_pop" => facility.avg_daily_pop,
      "pop_gender_id" => facility.pop_gender_id,
      "resident_address_id" => facility.resident_address_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, facility_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, facility_path(conn, :create), facility: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Facility, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, facility_path(conn, :create), facility: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    facility = Repo.insert! %Facility{}
    conn = put conn, facility_path(conn, :update, facility), facility: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Facility, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    facility = Repo.insert! %Facility{}
    conn = put conn, facility_path(conn, :update, facility), facility: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    facility = Repo.insert! %Facility{}
    conn = delete conn, facility_path(conn, :delete, facility)
    assert response(conn, 204)
    refute Repo.get(Facility, facility.id)
  end
end
