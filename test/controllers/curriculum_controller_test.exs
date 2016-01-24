defmodule Metanoia.CurriculumControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.Curriculum
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, curriculum_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    curriculum = Repo.insert! %Curriculum{}
    conn = get conn, curriculum_path(conn, :show, curriculum)
    assert json_response(conn, 200)["data"] == %{"id" => curriculum.id,
      "name" => curriculum.name,
      "description" => curriculum.description}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, curriculum_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, curriculum_path(conn, :create), curriculum: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Curriculum, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, curriculum_path(conn, :create), curriculum: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    curriculum = Repo.insert! %Curriculum{}
    conn = put conn, curriculum_path(conn, :update, curriculum), curriculum: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Curriculum, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    curriculum = Repo.insert! %Curriculum{}
    conn = put conn, curriculum_path(conn, :update, curriculum), curriculum: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    curriculum = Repo.insert! %Curriculum{}
    conn = delete conn, curriculum_path(conn, :delete, curriculum)
    assert response(conn, 204)
    refute Repo.get(Curriculum, curriculum.id)
  end
end
