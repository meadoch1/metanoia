defmodule Metanoia.FacilityController do
  use Metanoia.Web, :controller

  alias Metanoia.Facility

  plug :scrub_params, "facility" when action in [:create, :update]

  def index(conn, _params) do
    facilities = Repo.all(Facility)
    render(conn, "index.json", facilities: facilities)
  end

  def create(conn, %{"facility" => facility_params}) do
    changeset = Facility.changeset(%Facility{}, facility_params)

    case Repo.insert(changeset) do
      {:ok, facility} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", facility_path(conn, :show, facility))
        |> render("show.json", facility: facility)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    facility = Repo.get!(Facility, id)
    render(conn, "show.json", facility: facility)
  end

  def update(conn, %{"id" => id, "facility" => facility_params}) do
    facility = Repo.get!(Facility, id)
    changeset = Facility.changeset(facility, facility_params)

    case Repo.update(changeset) do
      {:ok, facility} ->
        render(conn, "show.json", facility: facility)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    facility = Repo.get!(Facility, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(facility)

    send_resp(conn, :no_content, "")
  end
end
