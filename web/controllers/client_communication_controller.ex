defmodule Metanoia.ClientCommunicationController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientCommunication

  plug :scrub_params, "client_communication" when action in [:create, :update]

  def index(conn, _params) do
    client_communications = Repo.all(ClientCommunication)
    render(conn, "index.json", client_communications: client_communications)
  end

  def create(conn, %{"client_communication" => client_communication_params}) do
    changeset = ClientCommunication.changeset(%ClientCommunication{}, client_communication_params)

    case Repo.insert(changeset) do
      {:ok, client_communication} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", client_communication_path(conn, :show, client_communication))
        |> render("show.json", client_communication: client_communication)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_communication = Repo.get!(ClientCommunication, id)
    render(conn, "show.json", client_communication: client_communication)
  end

  def update(conn, %{"id" => id, "client_communication" => client_communication_params}) do
    client_communication = Repo.get!(ClientCommunication, id)
    changeset = ClientCommunication.changeset(client_communication, client_communication_params)

    case Repo.update(changeset) do
      {:ok, client_communication} ->
        render(conn, "show.json", client_communication: client_communication)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_communication = Repo.get!(ClientCommunication, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(client_communication)

    send_resp(conn, :no_content, "")
  end
end
