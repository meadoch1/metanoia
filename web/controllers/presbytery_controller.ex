defmodule Metanoia.PresbyteryController do
  use Metanoia.Web, :controller

  alias Metanoia.Presbytery

  plug :scrub_params, "presbytery" when action in [:create, :update]

  def index(conn, _params) do
    presbyteries = Repo.all(Presbytery)
    render(conn, "index.json", presbyteries: presbyteries)
  end

  def create(conn, %{"presbytery" => presbytery_params}) do
    changeset = Presbytery.changeset(%Presbytery{}, presbytery_params)

    case Repo.insert(changeset) do
      {:ok, presbytery} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", presbytery_path(conn, :show, presbytery))
        |> render("show.json", presbytery: presbytery)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    presbytery = Repo.get!(Presbytery, id)
    render(conn, "show.json", presbytery: presbytery)
  end

  def update(conn, %{"id" => id, "presbytery" => presbytery_params}) do
    presbytery = Repo.get!(Presbytery, id)
    changeset = Presbytery.changeset(presbytery, presbytery_params)

    case Repo.update(changeset) do
      {:ok, presbytery} ->
        render(conn, "show.json", presbytery: presbytery)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    presbytery = Repo.get!(Presbytery, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(presbytery)

    send_resp(conn, :no_content, "")
  end
end
