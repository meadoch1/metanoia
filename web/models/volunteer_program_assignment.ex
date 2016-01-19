defmodule Metanoia.VolunteerProgramAssignment do
  use Metanoia.Web, :model

  schema "volunteer_program_assignments" do
    belongs_to :volunteer, Metanoia.Volunteer
    belongs_to :program, Metanoia.Program

    timestamps
  end

  @required_fields ~w(volunteer_id program_id)
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
