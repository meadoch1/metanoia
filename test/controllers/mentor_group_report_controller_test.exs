defmodule Metanoia.MentorGroupReportControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.MentorGroupReport
  @valid_attrs %{meeting_dt: "2010-04-17", note: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mentor_group_report_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    mentor_group_report = Repo.insert! %MentorGroupReport{}
    conn = get conn, mentor_group_report_path(conn, :show, mentor_group_report)
    assert json_response(conn, 200)["data"] == %{"id" => mentor_group_report.id,
      "meeting_dt" => mentor_group_report.meeting_dt,
      "mentor_group_id" => mentor_group_report.mentor_group_id,
      "note" => mentor_group_report.note}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mentor_group_report_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, mentor_group_report_path(conn, :create), mentor_group_report: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(MentorGroupReport, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mentor_group_report_path(conn, :create), mentor_group_report: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    mentor_group_report = Repo.insert! %MentorGroupReport{}
    conn = put conn, mentor_group_report_path(conn, :update, mentor_group_report), mentor_group_report: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(MentorGroupReport, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mentor_group_report = Repo.insert! %MentorGroupReport{}
    conn = put conn, mentor_group_report_path(conn, :update, mentor_group_report), mentor_group_report: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    mentor_group_report = Repo.insert! %MentorGroupReport{}
    conn = delete conn, mentor_group_report_path(conn, :delete, mentor_group_report)
    assert response(conn, 204)
    refute Repo.get(MentorGroupReport, mentor_group_report.id)
  end
end
