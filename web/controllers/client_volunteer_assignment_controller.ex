defmodule Metanoia.ClientVolunteerAssignmentController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientVolunteerAssignment

  plug :scrub_params, "client_volunteer_assignment" when action in [:create, :update]

  def index(conn, _params) do
    client_volunteer_assignments = Repo.all(ClientVolunteerAssignment)
    render(conn, "index.json", client_volunteer_assignments: client_volunteer_assignments)
  end

  def create(conn, %{"client_volunteer_assignment" => client_volunteer_assignment_params}) do
    changeset = ClientVolunteerAssignment.changeset(%ClientVolunteerAssignment{}, client_volunteer_assignment_params)

    case Repo.insert(changeset) do
      {:ok, client_volunteer_assignment} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", client_volunteer_assignment_path(conn, :show, client_volunteer_assignment))
        |> render("show.json", client_volunteer_assignment: client_volunteer_assignment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_volunteer_assignment = Repo.get!(ClientVolunteerAssignment, id)
    render(conn, "show.json", client_volunteer_assignment: client_volunteer_assignment)
  end

  def update(conn, %{"id" => id, "client_volunteer_assignment" => client_volunteer_assignment_params}) do
    client_volunteer_assignment = Repo.get!(ClientVolunteerAssignment, id)
    changeset = ClientVolunteerAssignment.changeset(client_volunteer_assignment, client_volunteer_assignment_params)

    case Repo.update(changeset) do
      {:ok, client_volunteer_assignment} ->
        render(conn, "show.json", client_volunteer_assignment: client_volunteer_assignment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_volunteer_assignment = Repo.get!(ClientVolunteerAssignment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(client_volunteer_assignment)

    send_resp(conn, :no_content, "")
  end
end
