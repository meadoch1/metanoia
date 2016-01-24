defmodule Metanoia.LessonControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Lesson
  @valid_attrs %{booklet: true, description: "some content", name: "some content", order_nr: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, lesson_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = get conn, lesson_path(conn, :show, lesson)
    assert json_response(conn, 200)["data"] == %{"id" => lesson.id,
      "name" => lesson.name,
      "description" => lesson.description,
      "booklet" => lesson.booklet,
      "order_nr" => lesson.order_nr,
      "course_id" => lesson.course_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, lesson_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, lesson_path(conn, :create), lesson: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Lesson, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, lesson_path(conn, :create), lesson: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = put conn, lesson_path(conn, :update, lesson), lesson: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Lesson, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = put conn, lesson_path(conn, :update, lesson), lesson: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    lesson = Repo.insert! %Lesson{}
    conn = delete conn, lesson_path(conn, :delete, lesson)
    assert response(conn, 204)
    refute Repo.get(Lesson, lesson.id)
  end
end
