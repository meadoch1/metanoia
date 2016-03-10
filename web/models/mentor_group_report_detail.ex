defmodule Metanoia.MentorGroupReportDetail do
  use Metanoia.Web, :model

  schema "mentor_group_report_details" do
    field :status, :string
    field :note, :string
    belongs_to :mentor_group_report, Metanoia.MentorGroupReport
    belongs_to :mentor_group_assignment, Metanoia.MentorGroupAssignment

    timestamps
  end

  @required_fields ~w(mentor_group_report_id mentor_group_assignment_id)
  @optional_fields ~w(status note)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def populate_default_details(mentor_group_report) do
    query = from g in Metanoia.MentorGroup, preload: [:mentor_group_assignments]
    mentor_group = Metanoia.Repo.get!(query, mentor_group_report.mentor_group_id)
    mentor_group.mentor_group_assignments
    |> Enum.each(
      fn(mentor_group_assignment) -> insert_default_details(mentor_group_report, mentor_group_assignment.id) end
    )
  end

  defp insert_default_details(mentor_group_report, mentor_group_assignment_id) do
    Ecto.build_assoc(mentor_group_report, :mentor_group_report_details, mentor_group_assignment_id: mentor_group_assignment_id)
    |> Metanoia.Repo.insert!
  end
end
