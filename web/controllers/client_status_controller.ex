defmodule Metanoia.ClientStatusController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientStatus

  plug :scrub_params, "client_status" when action in [:create, :update]

  def index(conn, _params) do
    client_status = Repo.all(ClientStatus)
    render(conn, "index.json", client_status: client_status)
  end

  def create(conn, %{"client_status" => client_status_params}) do
    changeset = ClientStatus.changeset(%ClientStatus{}, client_status_params)

    case Repo.insert(changeset) do
      {:ok, client_status} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", client_status_path(conn, :show, client_status))
        |> render("show.json", client_status: client_status)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_status = Repo.get!(ClientStatus, id)
    render(conn, "show.json", client_status: client_status)
  end

  def update(conn, %{"id" => id, "client_status" => client_status_params}) do
    client_status = Repo.get!(ClientStatus, id)
    changeset = ClientStatus.changeset(client_status, client_status_params)

    case Repo.update(changeset) do
      {:ok, client_status} ->
        render(conn, "show.json", client_status: client_status)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_status = Repo.get!(ClientStatus, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(client_status)

    send_resp(conn, :no_content, "")
  end
end
