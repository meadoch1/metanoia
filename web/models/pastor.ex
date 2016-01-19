defmodule Metanoia.Pastor do
  use Metanoia.Web, :model

  schema "pastors" do
    field :is_primary, :boolean, default: false
    field :is_head, :boolean, default: false
    belongs_to :person, Metanoia.Person

    timestamps
  end

  @required_fields ~w(is_primary is_head)
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
