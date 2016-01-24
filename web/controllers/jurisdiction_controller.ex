defmodule Metanoia.JurisdictionController do
  use Metanoia.Web, :controller

  alias Metanoia.Jurisdiction

  plug :scrub_params, "jurisdiction" when action in [:create, :update]

  def index(conn, _params) do
    jurisdictions = Repo.all(Jurisdiction)
    render(conn, "index.json", jurisdictions: jurisdictions)
  end

  def create(conn, %{"jurisdiction" => jurisdiction_params}) do
    changeset = Jurisdiction.changeset(%Jurisdiction{}, jurisdiction_params)

    case Repo.insert(changeset) do
      {:ok, jurisdiction} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", jurisdiction_path(conn, :show, jurisdiction))
        |> render("show.json", jurisdiction: jurisdiction)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jurisdiction = Repo.get!(Jurisdiction, id)
    render(conn, "show.json", jurisdiction: jurisdiction)
  end

  def update(conn, %{"id" => id, "jurisdiction" => jurisdiction_params}) do
    jurisdiction = Repo.get!(Jurisdiction, id)
    changeset = Jurisdiction.changeset(jurisdiction, jurisdiction_params)

    case Repo.update(changeset) do
      {:ok, jurisdiction} ->
        render(conn, "show.json", jurisdiction: jurisdiction)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jurisdiction = Repo.get!(Jurisdiction, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(jurisdiction)

    send_resp(conn, :no_content, "")
  end
end
