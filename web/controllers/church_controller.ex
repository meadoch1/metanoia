defmodule Metanoia.ChurchController do
  use Metanoia.Web, :controller

  alias Metanoia.Church

  plug :scrub_params, "church" when action in [:create, :update]

  def index(conn, _params) do
    churches = Repo.all(Church)
    render(conn, "index.json", churches: churches)
  end

  def create(conn, %{"church" => church_params}) do
    changeset = Church.changeset(%Church{}, church_params)

    case Repo.insert(changeset) do
      {:ok, church} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", church_path(conn, :show, church))
        |> render("show.json", church: church)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    church = Repo.get!(Church, id)
    render(conn, "show.json", church: church)
  end

  def update(conn, %{"id" => id, "church" => church_params}) do
    church = Repo.get!(Church, id)
    changeset = Church.changeset(church, church_params)

    case Repo.update(changeset) do
      {:ok, church} ->
        render(conn, "show.json", church: church)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    church = Repo.get!(Church, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(church)

    send_resp(conn, :no_content, "")
  end
end
