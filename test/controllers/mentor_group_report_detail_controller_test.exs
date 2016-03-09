defmodule Metanoia.MentorGroupReportDetailControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.MentorGroupReportDetail
  @valid_attrs %{note: "some content", status: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mentor_group_report_detail_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    mentor_group_report_detail = Repo.insert! %MentorGroupReportDetail{}
    conn = get conn, mentor_group_report_detail_path(conn, :show, mentor_group_report_detail)
    assert json_response(conn, 200)["data"] == %{"id" => mentor_group_report_detail.id,
      "mentor_group_report_id" => mentor_group_report_detail.mentor_group_report_id,
      "mentor_group_assignment_id" => mentor_group_report_detail.mentor_group_assignment_id,
      "status" => mentor_group_report_detail.status,
      "note" => mentor_group_report_detail.note}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mentor_group_report_detail_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, mentor_group_report_detail_path(conn, :create), mentor_group_report_detail: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(MentorGroupReportDetail, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mentor_group_report_detail_path(conn, :create), mentor_group_report_detail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    mentor_group_report_detail = Repo.insert! %MentorGroupReportDetail{}
    conn = put conn, mentor_group_report_detail_path(conn, :update, mentor_group_report_detail), mentor_group_report_detail: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(MentorGroupReportDetail, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mentor_group_report_detail = Repo.insert! %MentorGroupReportDetail{}
    conn = put conn, mentor_group_report_detail_path(conn, :update, mentor_group_report_detail), mentor_group_report_detail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    mentor_group_report_detail = Repo.insert! %MentorGroupReportDetail{}
    conn = delete conn, mentor_group_report_detail_path(conn, :delete, mentor_group_report_detail)
    assert response(conn, 204)
    refute Repo.get(MentorGroupReportDetail, mentor_group_report_detail.id)
  end
end
