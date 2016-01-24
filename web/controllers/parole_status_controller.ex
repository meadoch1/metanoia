defmodule Metanoia.ParoleStatusController do
  use Metanoia.Web, :controller

  alias Metanoia.ParoleStatus

  plug :scrub_params, "parole_status" when action in [:create, :update]

  def index(conn, _params) do
    parole_status = Repo.all(ParoleStatus)
    render(conn, "index.json", parole_status: parole_status)
  end

  def create(conn, %{"parole_status" => parole_status_params}) do
    changeset = ParoleStatus.changeset(%ParoleStatus{}, parole_status_params)

    case Repo.insert(changeset) do
      {:ok, parole_status} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", parole_status_path(conn, :show, parole_status))
        |> render("show.json", parole_status: parole_status)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parole_status = Repo.get!(ParoleStatus, id)
    render(conn, "show.json", parole_status: parole_status)
  end

  def update(conn, %{"id" => id, "parole_status" => parole_status_params}) do
    parole_status = Repo.get!(ParoleStatus, id)
    changeset = ParoleStatus.changeset(parole_status, parole_status_params)

    case Repo.update(changeset) do
      {:ok, parole_status} ->
        render(conn, "show.json", parole_status: parole_status)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parole_status = Repo.get!(ParoleStatus, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(parole_status)

    send_resp(conn, :no_content, "")
  end
end
