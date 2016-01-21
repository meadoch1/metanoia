defmodule Metanoia.MentoringView do
  use Metanoia.Web, :view

  def render("index.json", %{mentoring: mentoring, groups: groups}) do
    %{data: %{ mentoring: render_many(mentoring, Metanoia.MentoringView, "mentoring.json"), groups: render_many(groups, Metanoia.MentoringView, "mentoring.json")}}
  end

  def render("show.json", %{mentoring: mentoring, groups: groups}) do
    %{data: render_one(mentoring, Metanoia.MentoringView, "mentoring.json")}
  end

  def render("mentoring.json", %{mentoring: mentoring}) do
    mentoring
    # %{id: mentor_group.id, name: mentor_group.name, facility_id: mentor_group.facility_id, mentors: []}
  end
end
