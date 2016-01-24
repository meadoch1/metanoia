defmodule Metanoia.CourseControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Course
  @valid_attrs %{description: "some content", level: "some content", name: "some content", order_nr: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, course_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    course = Repo.insert! %Course{}
    conn = get conn, course_path(conn, :show, course)
    assert json_response(conn, 200)["data"] == %{"id" => course.id,
      "name" => course.name,
      "level" => course.level,
      "description" => course.description,
      "order_nr" => course.order_nr,
      "curriculum_id" => course.curriculum_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, course_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, course_path(conn, :create), course: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Course, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, course_path(conn, :create), course: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    course = Repo.insert! %Course{}
    conn = put conn, course_path(conn, :update, course), course: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Course, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    course = Repo.insert! %Course{}
    conn = put conn, course_path(conn, :update, course), course: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    course = Repo.insert! %Course{}
    conn = delete conn, course_path(conn, :delete, course)
    assert response(conn, 204)
    refute Repo.get(Course, course.id)
  end
end
