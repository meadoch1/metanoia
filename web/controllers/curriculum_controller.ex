defmodule Metanoia.CurriculumController do
  use Metanoia.Web, :controller

  alias Metanoia.Curriculum

  plug :scrub_params, "curriculum" when action in [:create, :update]

  def index(conn, _params) do
    curriculums = Repo.all(Curriculum)
    render(conn, "index.json", curriculums: curriculums)
  end

  def create(conn, %{"curriculum" => curriculum_params}) do
    changeset = Curriculum.changeset(%Curriculum{}, curriculum_params)

    case Repo.insert(changeset) do
      {:ok, curriculum} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", curriculum_path(conn, :show, curriculum))
        |> render("show.json", curriculum: curriculum)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    curriculum = Repo.get!(Curriculum, id)
    render(conn, "show.json", curriculum: curriculum)
  end

  def update(conn, %{"id" => id, "curriculum" => curriculum_params}) do
    curriculum = Repo.get!(Curriculum, id)
    changeset = Curriculum.changeset(curriculum, curriculum_params)

    case Repo.update(changeset) do
      {:ok, curriculum} ->
        render(conn, "show.json", curriculum: curriculum)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    curriculum = Repo.get!(Curriculum, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(curriculum)

    send_resp(conn, :no_content, "")
  end
end
