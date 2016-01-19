defmodule Metanoia.Church do
  use Metanoia.Web, :model

  schema "churches" do
    field :name, :string
    field :phone, :string
    field :one_time_support, :boolean, default: false
    field :ongoing_support, :boolean, default: false
    field :prayer_support, :boolean, default: false
    field :newsletter, :boolean, default: false
    belongs_to :address, Metanoia.Address
    belongs_to :denomination, Metanoia.Denomination
    belongs_to :presbytery, Metanoia.Presbytery

    timestamps
  end

  @required_fields ~w(name phone one_time_support ongoing_support prayer_support newsletter)
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
