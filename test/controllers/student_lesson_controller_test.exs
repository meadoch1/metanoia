require IEx
defmodule Metanoia.StudentLessonControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.StudentLesson
  alias Metanoia.Client
  alias Metanoia.Lesson
  @valid_attrs %{grade: "120.5", received_dt: "2010-04-17", sent_dt: "2010-04-17"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, student_lesson_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    student_lesson = Repo.insert! %StudentLesson{}
    conn = get conn, student_lesson_path(conn, :show, student_lesson)
    assert json_response(conn, 200)["data"] == %{"id" => student_lesson.id,
      "student_id" => student_lesson.student_id,
      "lesson_id" => student_lesson.lesson_id,
      "sent_dt" => student_lesson.sent_dt,
      "received_dt" => student_lesson.received_dt,
      "grade" => student_lesson.grade}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, student_lesson_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    student = Repo.insert! %Client{}
    lesson = Repo.insert! %Lesson{}
    attrs = @valid_attrs |> Map.put(:student_id, student.id) |> Map.put(:lesson_id, lesson.id)
    conn = post conn, student_lesson_path(conn, :create), student_lesson: attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(StudentLesson, attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, student_lesson_path(conn, :create), student_lesson: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    student = Repo.insert! %Client{}
    lesson = Repo.insert! %Lesson{}
    student_lesson = Repo.insert! %StudentLesson{}
    attrs = @valid_attrs |> Map.put(:student_id, student.id) |> Map.put(:lesson_id, lesson.id)
    conn = put conn, student_lesson_path(conn, :update, student_lesson), student_lesson: attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(StudentLesson, attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    student_lesson = Repo.insert! %StudentLesson{}
    conn = put conn, student_lesson_path(conn, :update, student_lesson), student_lesson: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    student_lesson = Repo.insert! %StudentLesson{}
    conn = delete conn, student_lesson_path(conn, :delete, student_lesson)
    assert response(conn, 204)
    refute Repo.get(StudentLesson, student_lesson.id)
  end
end
