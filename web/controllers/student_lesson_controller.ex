defmodule Metanoia.StudentLessonController do
  use Metanoia.Web, :controller

  alias Metanoia.StudentLesson

  plug :scrub_params, "student_lesson" when action in [:create, :update]

  def index(conn, _params) do
    student_lessons = Repo.all(StudentLesson)
    render(conn, "index.json", student_lessons: student_lessons)
  end

  def create(conn, %{"student_lesson" => student_lesson_params}) do
    changeset = StudentLesson.changeset(%StudentLesson{}, student_lesson_params)

    case Repo.insert(changeset) do
      {:ok, student_lesson} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", student_lesson_path(conn, :show, student_lesson))
        |> render("show.json", student_lesson: student_lesson)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    student_lesson = Repo.get!(StudentLesson, id)
    render(conn, "show.json", student_lesson: student_lesson)
  end

  def update(conn, %{"id" => id, "student_lesson" => student_lesson_params}) do
    student_lesson = Repo.get!(StudentLesson, id)
    changeset = StudentLesson.changeset(student_lesson, student_lesson_params)

    case Repo.update(changeset) do
      {:ok, student_lesson} ->
        render(conn, "show.json", student_lesson: student_lesson)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    student_lesson = Repo.get!(StudentLesson, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(student_lesson)

    send_resp(conn, :no_content, "")
  end
end
