defmodule Metanoia.MentorGroup do
  use Metanoia.Web, :model

  schema "mentor_groups" do
    field :name, :string
    belongs_to :leader, Metanoia.Volunteer
    belongs_to :facility, Metanoia.Facility
    has_many :mentor_group_assignments, Metanoia.MentorGroupAssignment
    has_many :schedule_entries, Metanoia.ScheduleEntry

    timestamps
  end

  @required_fields ~w(name facility_id)
  @optional_fields ~w(leader_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:facility_id)
    |> foreign_key_constraint(:leader_id)
  end

  def include_all_info(query) do
    from q in query,
    preload: [
      facility: [],
      schedule_entries: [],
      mentor_group_assignments: [
        volunteer: [person: [ address: [:address_type, :state] ]],
        client: [person: [ address: [:address_type, :state] ]],
        program: []
        ]
    ],
    select: q
  end

  def display_info(query) do
    from q in query,
    join: s in Metanoia.ScheduleEntry, on: s.mentor_group_id == q.id,
    select: %{id: q.id, name: q.name, leader_id: q.leader_id, facility_id: q.facility_id, meeting_day_of_week: s.day_of_week, meeting_week_of_month: s.week_of_month}
  end

  def last_meeting_date(id) do
    Metanoia.ScheduleEntry
    |> Metanoia.ScheduleEntry.for_group(id)
    |> Metanoia.Repo.all
    |> Enum.map( fn(entry) -> {entry.day_of_week, entry.week_of_month} end )
    |> Metanoia.MeetingDateCalculator.prior_date_of_meeting
  end

end
