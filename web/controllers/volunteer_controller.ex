defmodule Metanoia.VolunteerController do
  use Metanoia.Web, :controller

  alias Metanoia.Volunteer

  plug :scrub_params, "volunteer" when action in [:create, :update]

  def index(conn, _params) do
    volunteers = Repo.all(Volunteer) |> Repo.preload([:person])
    render(conn, "index.json", volunteers: volunteers)
  end

  def create(conn, %{"volunteer" => volunteer_params}) do
    changeset = Volunteer.changeset(%Volunteer{}, volunteer_params)

    case Repo.insert(changeset) do
      {:ok, volunteer} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", volunteer_path(conn, :show, volunteer))
        |> render("show.json", volunteer: volunteer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    volunteer = Repo.get!(Volunteer, id) |> Repo.preload([:person])
    render(conn, "show.json", volunteer: volunteer)
  end

  def update(conn, %{"id" => id, "volunteer" => volunteer_params}) do
    volunteer = Repo.get!(Volunteer, id)
    changeset = Volunteer.changeset(volunteer, volunteer_params)

    case Repo.update(changeset) do
      {:ok, volunteer} ->
        render(conn, "show.json", volunteer: volunteer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    volunteer = Repo.get!(Volunteer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(volunteer)

    send_resp(conn, :no_content, "")
  end
end
