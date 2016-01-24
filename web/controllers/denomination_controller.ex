defmodule Metanoia.DenominationController do
  use Metanoia.Web, :controller

  alias Metanoia.Denomination

  plug :scrub_params, "denomination" when action in [:create, :update]

  def index(conn, _params) do
    denominations = Repo.all(Denomination)
    render(conn, "index.json", denominations: denominations)
  end

  def create(conn, %{"denomination" => denomination_params}) do
    changeset = Denomination.changeset(%Denomination{}, denomination_params)

    case Repo.insert(changeset) do
      {:ok, denomination} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", denomination_path(conn, :show, denomination))
        |> render("show.json", denomination: denomination)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    denomination = Repo.get!(Denomination, id)
    render(conn, "show.json", denomination: denomination)
  end

  def update(conn, %{"id" => id, "denomination" => denomination_params}) do
    denomination = Repo.get!(Denomination, id)
    changeset = Denomination.changeset(denomination, denomination_params)

    case Repo.update(changeset) do
      {:ok, denomination} ->
        render(conn, "show.json", denomination: denomination)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    denomination = Repo.get!(Denomination, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(denomination)

    send_resp(conn, :no_content, "")
  end
end
