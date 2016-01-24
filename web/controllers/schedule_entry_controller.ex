defmodule Metanoia.ScheduleEntryController do
  use Metanoia.Web, :controller

  alias Metanoia.ScheduleEntry

  plug :scrub_params, "schedule_entry" when action in [:create, :update]

  def index(conn, _params) do
    schedule_entries = Repo.all(ScheduleEntry)
    render(conn, "index.json", schedule_entries: schedule_entries)
  end

  def create(conn, %{"schedule_entry" => schedule_entry_params}) do
    changeset = ScheduleEntry.changeset(%ScheduleEntry{}, schedule_entry_params)

    case Repo.insert(changeset) do
      {:ok, schedule_entry} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", schedule_entry_path(conn, :show, schedule_entry))
        |> render("show.json", schedule_entry: schedule_entry)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    schedule_entry = Repo.get!(ScheduleEntry, id)
    render(conn, "show.json", schedule_entry: schedule_entry)
  end

  def update(conn, %{"id" => id, "schedule_entry" => schedule_entry_params}) do
    schedule_entry = Repo.get!(ScheduleEntry, id)
    changeset = ScheduleEntry.changeset(schedule_entry, schedule_entry_params)

    case Repo.update(changeset) do
      {:ok, schedule_entry} ->
        render(conn, "show.json", schedule_entry: schedule_entry)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    schedule_entry = Repo.get!(ScheduleEntry, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(schedule_entry)

    send_resp(conn, :no_content, "")
  end
end
