defmodule Metanoia.User do
  use Metanoia.Web, :model

  schema "users" do
    field :username, :string
    field :encrypted_password, :string
    field :admin, :boolean, default: false
    belongs_to :person, Metanoia.Person

    timestamps
  end

  @required_fields ~w(username encrypted_password admin)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
