defmodule Metanoia.Volunteer do
  use Metanoia.Web, :model

  schema "volunteers" do
    field :mna_second_career, :boolean, default: false
    belongs_to :person, Metanoia.Person
    belongs_to :volunteer_status, Metanoia.VolunteerStatus
    belongs_to :relationship_preference, Metanoia.RelationshipPreference
    has_many :assignments, Metanoia.ClientVolunteerAssignment

    timestamps
  end

  @required_fields ~w(mna_second_career)
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
    left_join: vs in Metanoia.VolunteerStatus, on: q.volunteer_status_id == vs.id,
    left_join: rp in Metanoia.RelationshipPreference, on: q.relationship_preference_id == rp.id,
    select: %{id: q.id, first_name: p.first_name, last_name: p.last_name, state: s.abbreviation, status: vs.name, preference: rp.name}
  end

  def include_all_info(query) do
    new_query = from q in query,
    preload: [
      person: [ address: [:address_type, :state] ],
      volunteer_status: [],
      relationship_preference: [],
      assignments: [client: [person: [ address: [:address_type, :state] ]], program: []]
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

  def status_like(query, "") do
    query
  end

  def status_like(query, name) do
    from q in query,
    join: p in Metanoia.VolunteerStatus, on: q.volunteer_status_id == p.id,
    where: fragment("? like ?", p.name, ^"#{name}%")
  end

  def preference_like(query, "") do
    query
  end

  def preference_like(query, name) do
    from q in query,
    join: p in Metanoia.RelationshipPreference, on: q.relationship_preference_id == p.id,
    where: fragment("? like ?", p.name, ^"#{name}%")
  end

end
