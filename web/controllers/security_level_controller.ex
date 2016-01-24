defmodule Metanoia.SecurityLevelController do
  use Metanoia.Web, :controller

  alias Metanoia.SecurityLevel

  plug :scrub_params, "security_level" when action in [:create, :update]

  def index(conn, _params) do
    security_levels = Repo.all(SecurityLevel)
    render(conn, "index.json", security_levels: security_levels)
  end

  def create(conn, %{"security_level" => security_level_params}) do
    changeset = SecurityLevel.changeset(%SecurityLevel{}, security_level_params)

    case Repo.insert(changeset) do
      {:ok, security_level} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", security_level_path(conn, :show, security_level))
        |> render("show.json", security_level: security_level)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    security_level = Repo.get!(SecurityLevel, id)
    render(conn, "show.json", security_level: security_level)
  end

  def update(conn, %{"id" => id, "security_level" => security_level_params}) do
    security_level = Repo.get!(SecurityLevel, id)
    changeset = SecurityLevel.changeset(security_level, security_level_params)

    case Repo.update(changeset) do
      {:ok, security_level} ->
        render(conn, "show.json", security_level: security_level)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    security_level = Repo.get!(SecurityLevel, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(security_level)

    send_resp(conn, :no_content, "")
  end
end
