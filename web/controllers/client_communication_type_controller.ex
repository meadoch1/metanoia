defmodule Metanoia.ClientCommunicationTypeController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientCommunicationType

  plug :scrub_params, "client_communication_type" when action in [:create, :update]

  def index(conn, _params) do
    client_commmunication_types = Repo.all(ClientCommunicationType)
    render(conn, "index.json", client_commmunication_types: client_commmunication_types)
  end

  def create(conn, %{"client_communication_type" => client_communication_type_params}) do
    changeset = ClientCommunicationType.changeset(%ClientCommunicationType{}, client_communication_type_params)

    case Repo.insert(changeset) do
      {:ok, client_communication_type} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", client_communication_type_path(conn, :show, client_communication_type))
        |> render("show.json", client_communication_type: client_communication_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_communication_type = Repo.get!(ClientCommunicationType, id)
    render(conn, "show.json", client_communication_type: client_communication_type)
  end

  def update(conn, %{"id" => id, "client_communication_type" => client_communication_type_params}) do
    client_communication_type = Repo.get!(ClientCommunicationType, id)
    changeset = ClientCommunicationType.changeset(client_communication_type, client_communication_type_params)

    case Repo.update(changeset) do
      {:ok, client_communication_type} ->
        render(conn, "show.json", client_communication_type: client_communication_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_communication_type = Repo.get!(ClientCommunicationType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(client_communication_type)

    send_resp(conn, :no_content, "")
  end
end
