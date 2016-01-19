defmodule Metanoia.MentorGroupAssignment do
  use Metanoia.Web, :model

  schema "mentor_group_assignments" do
    field :comments, :string
    belongs_to :mentor_group, Metanoia.MentorGroup
    belongs_to :volunteer, Metanoia.Volunteer

    timestamps
  end

  @required_fields ~w()
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
