defmodule Metanoia.MentorGroupAssignment do
  use Metanoia.Web, :model

  schema "mentor_group_assignments" do
    field :comments, :string
    field :start_month, Ecto.Date
    belongs_to :mentor_group, Metanoia.MentorGroup
    belongs_to :volunteer, Metanoia.Volunteer
    belongs_to :client, Metanoia.Client
    belongs_to :program, Metanoia.Program

    timestamps
  end

  @required_fields ~w(mentor_group_id volunteer_id)
  @optional_fields ~w(comments start_month client_id program_id)

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
