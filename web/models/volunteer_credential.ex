defmodule Metanoia.VolunteerCredential do
  use Metanoia.Web, :model

  schema "volunteer_credentials" do
    field :credential_cd, :string
    field :expiration_dt, Ecto.Date
    field :comment, :string
    belongs_to :volunteer, Metanoia.Volunteer
    belongs_to :facility, Metanoia.Facility

    timestamps
  end

  @required_fields ~w(credential_cd expiration_dt comment)
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
