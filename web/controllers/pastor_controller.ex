defmodule Metanoia.PastorController do
  use Metanoia.Web, :controller

  alias Metanoia.Pastor

  plug :scrub_params, "pastor" when action in [:create, :update]

  def index(conn, _params) do
    pastors = Repo.all(Pastor)
    render(conn, "index.json", pastors: pastors)
  end

  def create(conn, %{"pastor" => pastor_params}) do
    changeset = Pastor.changeset(%Pastor{}, pastor_params)

    case Repo.insert(changeset) do
      {:ok, pastor} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", pastor_path(conn, :show, pastor))
        |> render("show.json", pastor: pastor)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pastor = Repo.get!(Pastor, id)
    render(conn, "show.json", pastor: pastor)
  end

  def update(conn, %{"id" => id, "pastor" => pastor_params}) do
    pastor = Repo.get!(Pastor, id)
    changeset = Pastor.changeset(pastor, pastor_params)

    case Repo.update(changeset) do
      {:ok, pastor} ->
        render(conn, "show.json", pastor: pastor)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pastor = Repo.get!(Pastor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pastor)

    send_resp(conn, :no_content, "")
  end
end
