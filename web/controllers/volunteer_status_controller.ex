defmodule Metanoia.VolunteerStatusController do
  use Metanoia.Web, :controller

  alias Metanoia.VolunteerStatus

  plug :scrub_params, "volunteer_status" when action in [:create, :update]

  def index(conn, _params) do
    volunteer_status = Repo.all(VolunteerStatus)
    render(conn, "index.json", volunteer_status: volunteer_status)
  end

  def create(conn, %{"volunteer_status" => volunteer_status_params}) do
    changeset = VolunteerStatus.changeset(%VolunteerStatus{}, volunteer_status_params)

    case Repo.insert(changeset) do
      {:ok, volunteer_status} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", volunteer_status_path(conn, :show, volunteer_status))
        |> render("show.json", volunteer_status: volunteer_status)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    volunteer_status = Repo.get!(VolunteerStatus, id)
    render(conn, "show.json", volunteer_status: volunteer_status)
  end

  def update(conn, %{"id" => id, "volunteer_status" => volunteer_status_params}) do
    volunteer_status = Repo.get!(VolunteerStatus, id)
    changeset = VolunteerStatus.changeset(volunteer_status, volunteer_status_params)

    case Repo.update(changeset) do
      {:ok, volunteer_status} ->
        render(conn, "show.json", volunteer_status: volunteer_status)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    volunteer_status = Repo.get!(VolunteerStatus, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(volunteer_status)

    send_resp(conn, :no_content, "")
  end
end
