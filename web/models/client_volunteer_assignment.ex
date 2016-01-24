defmodule Metanoia.ClientVolunteerAssignment do
  use Metanoia.Web, :model

  schema "client_volunteer_assignments" do
    field :start_month, Ecto.Date
    belongs_to :client, Metanoia.Client
    belongs_to :program, Metanoia.Program
    belongs_to :volunteer, Metanoia.Volunteer

    timestamps
  end

  @required_fields ~w(program_id volunteer_id)
  @optional_fields ~w(start_month client_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:volunteer_id)
    |> foreign_key_constraint(:program_id)
    |> foreign_key_constraint(:client_id)
  end

  def mentoring_info(query) do
    from q in query,
    join: v in Metanoia.Volunteer, on: q.volunteer_id == v.id,
    join: vp in Metanoia.Person, on: v.person_id == vp.id,
    join: mga in Metanoia.MentorGroupAssignment, on: v.id == mga.volunteer_id,
    join: g in Metanoia.MentorGroup, on: mga.mentor_group_id == g.id,
    join: c in Metanoia.Client, on: q.client_id == c.id,
    join: cp in Metanoia.Person, on: c.person_id == cp.id,
    select: %{id: q.id, group_name: g.name, group_id: g.id, mentor_id: v.id, mentor_first_name: vp.first_name, mentor_last_name: vp.last_name, mentee_id: c.id, mentee_first_name: cp.first_name, mentee_last_name: cp.last_name, facility_ref_cd: c.facility_ref_cd, comments: mga.comments}
  end
end
