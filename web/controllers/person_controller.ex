defmodule Metanoia.PersonController do
  use Metanoia.Web, :controller

  alias Metanoia.Person

  plug :scrub_params, "person" when action in [:create, :update]

  def index(conn, _params) do
    persons = Repo.all(Person)
    render(conn, "index.json", persons: persons)
  end

  def create(conn, %{"person" => person_params}) do
    changeset = Person.changeset(%Person{}, person_params)

    case Repo.insert(changeset) do
      {:ok, person} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", person_path(conn, :show, person))
        |> render("show.json", person: person)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)
    render(conn, "show.json", person: person)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Repo.get!(Person, id)
    changeset = Person.changeset(person, person_params)

    case Repo.update(changeset) do
      {:ok, person} ->
        render(conn, "show.json", person: person)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(person)

    send_resp(conn, :no_content, "")
  end
end
