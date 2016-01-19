defmodule Metanoia.Client do
  use Metanoia.Web, :model

  schema "clients" do
    field :facility_ref_cd, :string
    field :earliest_out_dt, Ecto.Date
    field :note, :string
    field :facility_address_text, :string
    field :grader_address_text, :string
    field :tentative_parole_month, Ecto.Date
    field :max_possible_release_dt, Ecto.Date
    field :comment, :string
    belongs_to :person, Metanoia.Person
    belongs_to :facility, Metanoia.Facility
    belongs_to :client_status, Metanoia.ClientStatus
    belongs_to :parole_status, Metanoia.ParoleStatus
    has_many :assignments, Metanoia.ClientVolunteerAssignment
    has_many :student_lessons, Metanoia.StudentLesson, foreign_key: :student_id

    timestamps
  end

  @required_fields ~w(facility_ref_cd earliest_out_dt note)
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

  def search_info(query) do
    from q in query,
    join: p in Metanoia.Person, on: q.person_id == p.id,
    join: a in Metanoia.Address, on: p.address_id == a.id,
    join: s in Metanoia.State, on: a.state_id == s.id,
    select: %{id: q.id, facility_ref_cd: q.facility_ref_cd, first_name: p.first_name, last_name: p.last_name, middle_name: p.middle_name, state: s.abbreviation}
  end

  def include_all_info(query) do
    new_query = from q in query,
    preload: [
      person: [ address: [:address_type, :state] ],
      facility: [ address: [:address_type, :state] ],
      client_status: [],
      student_lessons: [lesson: [:course] ],
      assignments: [volunteer: [person: [ address: [:address_type, :state] ]], program: []]
    ],
    select: q

  end

  def first_name_like(query, "") do
    query
  end

  def first_name_like(query, name) do
    from q in query,
    join: p in Metanoia.Person, on: q.person_id == p.id,
    where: fragment("? like ?", p.first_name, ^"#{name}%")
  end

  def last_name_like(query, "") do
    query
  end

  def last_name_like(query, name) do
    from q in query,
    join: p in Metanoia.Person, on: q.person_id == p.id,
    where: fragment("? like ?", p.last_name, ^"#{name}%")
  end

  def middle_name_like(query, "") do
    query
  end

  def middle_name_like(query, name) do
    from q in query,
    join: p in Metanoia.Person, on: q.person_id == p.id,
    where: fragment("? like ?", p.middle_name, ^"#{name}%")
  end

  def state_like(query, "") do
    query
  end

  def state_like(query, abbrev) do
    from q in query,
    join: p in Metanoia.Person, on: p.id == q.person_id,
    join: a in Metanoia.Address, on: p.address_id == a.id,
    join: s in Metanoia.State, on: a.state_id == s.id,
    where: fragment("? like ?", s.abbreviation, ^"#{abbrev}%")
  end

  def facility_ref_cd_like(query, "") do
    query
  end

  def facility_ref_cd_like(query, code) do
    from q in query,
    where: fragment("? like ?", q.facility_ref_cd, ^"#{code}%")
  end

end
