defmodule Metanoia.VolunteerView do
  use Metanoia.Web, :view

  def render("mentor.json", %{volunteer: mentor}) do
     %{id: mentor.id, person: render_one(mentor.person, Metanoia.PersonView, "person.json")}
  end

end
