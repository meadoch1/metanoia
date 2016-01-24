defmodule Metanoia.MentorGroupAssignmentController do
  use Metanoia.Web, :controller

  alias Metanoia.MentorGroupAssignment

  plug :scrub_params, "mentor_group_assignment" when action in [:create, :update]

  def index(conn, _params) do
    mentor_group_assignments = Repo.all(MentorGroupAssignment)
    render(conn, "index.json", mentor_group_assignments: mentor_group_assignments)
  end

  def create(conn, %{"mentor_group_assignment" => mentor_group_assignment_params}) do
    changeset = MentorGroupAssignment.changeset(%MentorGroupAssignment{}, mentor_group_assignment_params)

    case Repo.insert(changeset) do
      {:ok, mentor_group_assignment} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", mentor_group_assignment_path(conn, :show, mentor_group_assignment))
        |> render("show.json", mentor_group_assignment: mentor_group_assignment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mentor_group_assignment = Repo.get!(MentorGroupAssignment, id)
    render(conn, "show.json", mentor_group_assignment: mentor_group_assignment)
  end

  def update(conn, %{"id" => id, "mentor_group_assignment" => mentor_group_assignment_params}) do
    mentor_group_assignment = Repo.get!(MentorGroupAssignment, id)
    changeset = MentorGroupAssignment.changeset(mentor_group_assignment, mentor_group_assignment_params)

    case Repo.update(changeset) do
      {:ok, mentor_group_assignment} ->
        render(conn, "show.json", mentor_group_assignment: mentor_group_assignment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mentor_group_assignment = Repo.get!(MentorGroupAssignment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mentor_group_assignment)

    send_resp(conn, :no_content, "")
  end
end
