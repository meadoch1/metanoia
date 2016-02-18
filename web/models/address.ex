defmodule Metanoia.Address do
  use Metanoia.Web, :model

  schema "addresses" do
    field :line1, :string
    field :line2, :string
    field :city, :string
    field :zip_code, :string
    field :latitude, :float
    field :longitude, :float
    belongs_to :address_type, Metanoia.AddressType
    belongs_to :state, Metanoia.State

    timestamps
  end

  @required_fields ~w(line1 line2 city zip_code)
  @optional_fields ~w( latitude longitude)

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
