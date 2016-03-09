defmodule Metanoia.MentorGroupReport do
  use Metanoia.Web, :model

  schema "mentor_group_reports" do
    field :meeting_dt, Ecto.Date
    field :note, :string
    belongs_to :mentor_group, Metanoia.MentorGroup
    has_many :mentor_group_report_details, Metanoia.MentorGroupReportDetail

    timestamps
  end

  @required_fields ~w(meeting_dt mentor_group_id)
  @optional_fields ~w(note)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def latest_for_group(query, mentor_group_id, last_date) do
    from q in query,
    where: [mentor_group_id: ^mentor_group_id, meeting_dt: ^last_date],
    order_by: [desc: q.meeting_dt],
    limit: 1,
    preload: [
      mentor_group_report_details: []
    ],
    select: q
  end
end
