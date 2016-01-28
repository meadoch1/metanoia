defmodule Metanoia.MentoringView do
  use Metanoia.Web, :view

  def render("index.json", %{mentoring: mentoring, groups: groups, mentors: mentors, clients: clients}) do
    %{data: %{
               mentoring: render_many_with_query(mentoring),
               # groups: render_many_with_query(groups),
               # mentors: render_many(mentors, Metanoia.VolunteerView, "volunteer.json"),
               # clients: render_many(clients, Metanoia.ClientView, "client.json")
             }}
  end

  def render("show.json", %{mentoring: mentoring, groups: groups}) do
    %{data: render_one(mentoring, Metanoia.MentoringView, "mentoring.json")}
  end

  def render("mentoring.json", %{mentoring: mentoring}) do
    mentoring
    # %{id: mentor_group.id, name: mentor_group.name, facility_id: mentor_group.facility_id, mentors: []}
  end

  defp render_many_with_query(query) do
    render_many(query, Metanoia.MentoringView, "mentoring.json")
  end
end
