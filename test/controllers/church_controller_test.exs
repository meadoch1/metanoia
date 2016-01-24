defmodule Metanoia.ChurchControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Church
  @valid_attrs %{name: "some content", newsletter: true, one_time_support: true, ongoing_support: true, phone: "some content", prayer_support: true}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, church_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = get conn, church_path(conn, :show, church)
    assert json_response(conn, 200)["data"] == %{"id" => church.id,
      "name" => church.name,
      "address_id" => church.address_id,
      "phone" => church.phone,
      "denomination_id" => church.denomination_id,
      "presbytery_id" => church.presbytery_id,
      "one_time_support" => church.one_time_support,
      "ongoing_support" => church.ongoing_support,
      "prayer_support" => church.prayer_support,
      "newsletter" => church.newsletter}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, church_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, church_path(conn, :create), church: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Church, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, church_path(conn, :create), church: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = put conn, church_path(conn, :update, church), church: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Church, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = put conn, church_path(conn, :update, church), church: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = delete conn, church_path(conn, :delete, church)
    assert response(conn, 204)
    refute Repo.get(Church, church.id)
  end
end
