defmodule Metanoia.Facility do
  use Metanoia.Web, :model

  schema "facilities" do
    field :name, :string
    field :courier, :string
    field :avg_daily_pop, :integer
    belongs_to :address, Metanoia.Address
    belongs_to :warden, Metanoia.Warden
    belongs_to :chaplain, Metanoia.Chaplain
    belongs_to :jurisdiction, Metanoia.Jurisdiction
    belongs_to :security_level, Metanoia.SecurityLevel
    belongs_to :pop_gender, Metanoia.PopGender

    timestamps
  end

  @required_fields ~w(name courier avg_daily_pop)
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
