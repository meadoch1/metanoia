defmodule Metanoia.VolunteerCredentialController do
  use Metanoia.Web, :controller

  alias Metanoia.VolunteerCredential

  plug :scrub_params, "volunteer_credential" when action in [:create, :update]

  def index(conn, _params) do
    volunteer_credentials = Repo.all(VolunteerCredential)
    render(conn, "index.json", volunteer_credentials: volunteer_credentials)
  end

  def create(conn, %{"volunteer_credential" => volunteer_credential_params}) do
    changeset = VolunteerCredential.changeset(%VolunteerCredential{}, volunteer_credential_params)

    case Repo.insert(changeset) do
      {:ok, volunteer_credential} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", volunteer_credential_path(conn, :show, volunteer_credential))
        |> render("show.json", volunteer_credential: volunteer_credential)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    volunteer_credential = Repo.get!(VolunteerCredential, id)
    render(conn, "show.json", volunteer_credential: volunteer_credential)
  end

  def update(conn, %{"id" => id, "volunteer_credential" => volunteer_credential_params}) do
    volunteer_credential = Repo.get!(VolunteerCredential, id)
    changeset = VolunteerCredential.changeset(volunteer_credential, volunteer_credential_params)

    case Repo.update(changeset) do
      {:ok, volunteer_credential} ->
        render(conn, "show.json", volunteer_credential: volunteer_credential)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    volunteer_credential = Repo.get!(VolunteerCredential, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(volunteer_credential)

    send_resp(conn, :no_content, "")
  end
end
