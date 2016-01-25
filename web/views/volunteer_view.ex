defmodule Metanoia.VolunteerView do
  use Metanoia.Web, :view
  use Metanoia.RelationRender

  def render("index.json", %{volunteers: volunteers}) do
    %{data: render_many(volunteers, Metanoia.VolunteerView, "volunteer.json")}
  end

  def render("show.json", %{volunteer: volunteer}) do
    %{data: render_one(volunteer, Metanoia.VolunteerView, "volunteer.json")}
  end

  def render("volunteer.json", %{volunteer: volunteer}) do
    %{id: volunteer.id,
      person_id: volunteer.person_id,
      volunteer_status_id: volunteer.volunteer_status_id,
      relationship_preference_id: volunteer.relationship_preference_id,
      mna_second_career: volunteer.mna_second_career,
      note: volunteer.note}
    |> render_relation( :person, volunteer.person, Metanoia.PersonView, "person.json")
  end
end
