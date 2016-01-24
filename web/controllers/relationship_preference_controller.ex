defmodule Metanoia.RelationshipPreferenceController do
  use Metanoia.Web, :controller

  alias Metanoia.RelationshipPreference

  plug :scrub_params, "relationship_preference" when action in [:create, :update]

  def index(conn, _params) do
    relationship_preferences = Repo.all(RelationshipPreference)
    render(conn, "index.json", relationship_preferences: relationship_preferences)
  end

  def create(conn, %{"relationship_preference" => relationship_preference_params}) do
    changeset = RelationshipPreference.changeset(%RelationshipPreference{}, relationship_preference_params)

    case Repo.insert(changeset) do
      {:ok, relationship_preference} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", relationship_preference_path(conn, :show, relationship_preference))
        |> render("show.json", relationship_preference: relationship_preference)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    relationship_preference = Repo.get!(RelationshipPreference, id)
    render(conn, "show.json", relationship_preference: relationship_preference)
  end

  def update(conn, %{"id" => id, "relationship_preference" => relationship_preference_params}) do
    relationship_preference = Repo.get!(RelationshipPreference, id)
    changeset = RelationshipPreference.changeset(relationship_preference, relationship_preference_params)

    case Repo.update(changeset) do
      {:ok, relationship_preference} ->
        render(conn, "show.json", relationship_preference: relationship_preference)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    relationship_preference = Repo.get!(RelationshipPreference, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(relationship_preference)

    send_resp(conn, :no_content, "")
  end
end
