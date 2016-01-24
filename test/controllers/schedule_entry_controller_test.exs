defmodule Metanoia.ScheduleEntryControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.ScheduleEntry
  @valid_attrs %{day_of_week: 42, week_of_month: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, schedule_entry_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    schedule_entry = Repo.insert! %ScheduleEntry{}
    conn = get conn, schedule_entry_path(conn, :show, schedule_entry)
    assert json_response(conn, 200)["data"] == %{"id" => schedule_entry.id,
      "day_of_week" => schedule_entry.day_of_week,
      "week_of_month" => schedule_entry.week_of_month,
      "mentor_group_id" => schedule_entry.mentor_group_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, schedule_entry_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, schedule_entry_path(conn, :create), schedule_entry: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ScheduleEntry, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, schedule_entry_path(conn, :create), schedule_entry: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    schedule_entry = Repo.insert! %ScheduleEntry{}
    conn = put conn, schedule_entry_path(conn, :update, schedule_entry), schedule_entry: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ScheduleEntry, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    schedule_entry = Repo.insert! %ScheduleEntry{}
    conn = put conn, schedule_entry_path(conn, :update, schedule_entry), schedule_entry: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    schedule_entry = Repo.insert! %ScheduleEntry{}
    conn = delete conn, schedule_entry_path(conn, :delete, schedule_entry)
    assert response(conn, 204)
    refute Repo.get(ScheduleEntry, schedule_entry.id)
  end
end
