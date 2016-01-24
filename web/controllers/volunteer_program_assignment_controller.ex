defmodule Metanoia.VolunteerProgramAssignmentController do
  use Metanoia.Web, :controller

  alias Metanoia.VolunteerProgramAssignment

  plug :scrub_params, "volunteer_program_assignment" when action in [:create, :update]

  def index(conn, _params) do
    volunteer_program_assignments = Repo.all(VolunteerProgramAssignment)
    render(conn, "index.json", volunteer_program_assignments: volunteer_program_assignments)
  end

  def create(conn, %{"volunteer_program_assignment" => volunteer_program_assignment_params}) do
    changeset = VolunteerProgramAssignment.changeset(%VolunteerProgramAssignment{}, volunteer_program_assignment_params)

    case Repo.insert(changeset) do
      {:ok, volunteer_program_assignment} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", volunteer_program_assignment_path(conn, :show, volunteer_program_assignment))
        |> render("show.json", volunteer_program_assignment: volunteer_program_assignment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    volunteer_program_assignment = Repo.get!(VolunteerProgramAssignment, id)
    render(conn, "show.json", volunteer_program_assignment: volunteer_program_assignment)
  end

  def update(conn, %{"id" => id, "volunteer_program_assignment" => volunteer_program_assignment_params}) do
    volunteer_program_assignment = Repo.get!(VolunteerProgramAssignment, id)
    changeset = VolunteerProgramAssignment.changeset(volunteer_program_assignment, volunteer_program_assignment_params)

    case Repo.update(changeset) do
      {:ok, volunteer_program_assignment} ->
        render(conn, "show.json", volunteer_program_assignment: volunteer_program_assignment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    volunteer_program_assignment = Repo.get!(VolunteerProgramAssignment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(volunteer_program_assignment)

    send_resp(conn, :no_content, "")
  end
end
