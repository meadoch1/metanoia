defmodule Metanoia.MentorGroupController do
  use Metanoia.Web, :controller

  alias Metanoia.MentorGroup

  plug :scrub_params, "mentor_group" when action in [:create, :update]

  def index(conn, _params) do
    mentor_groups = Repo.all(MentorGroup)
    render(conn, "index.json", mentor_groups: mentor_groups)
  end

  def create(conn, %{"mentor_group" => mentor_group_params}) do
    changeset = MentorGroup.changeset(%MentorGroup{}, mentor_group_params)

    case Repo.insert(changeset) do
      {:ok, mentor_group} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", mentor_group_path(conn, :show, mentor_group))
        |> render("show.json", mentor_group: mentor_group)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mentor_group = Repo.get!(MentorGroup, id)
    render(conn, "show.json", mentor_group: mentor_group)
  end

  def update(conn, %{"id" => id, "mentor_group" => mentor_group_params}) do
    mentor_group = Repo.get!(MentorGroup, id)
    changeset = MentorGroup.changeset(mentor_group, mentor_group_params)

    case Repo.update(changeset) do
      {:ok, mentor_group} ->
        render(conn, "show.json", mentor_group: mentor_group)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mentor_group = Repo.get!(MentorGroup, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mentor_group)

    send_resp(conn, :no_content, "")
  end
end
