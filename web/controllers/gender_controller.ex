defmodule Metanoia.GenderController do
  use Metanoia.Web, :controller

  alias Metanoia.Gender

  plug :scrub_params, "gender" when action in [:create, :update]

  def index(conn, _params) do
    genders = Repo.all(Gender)
    render(conn, "index.json", genders: genders)
  end

  def create(conn, %{"gender" => gender_params}) do
    changeset = Gender.changeset(%Gender{}, gender_params)

    case Repo.insert(changeset) do
      {:ok, gender} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", gender_path(conn, :show, gender))
        |> render("show.json", gender: gender)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gender = Repo.get!(Gender, id)
    render(conn, "show.json", gender: gender)
  end

  def update(conn, %{"id" => id, "gender" => gender_params}) do
    gender = Repo.get!(Gender, id)
    changeset = Gender.changeset(gender, gender_params)

    case Repo.update(changeset) do
      {:ok, gender} ->
        render(conn, "show.json", gender: gender)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gender = Repo.get!(Gender, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gender)

    send_resp(conn, :no_content, "")
  end
end
