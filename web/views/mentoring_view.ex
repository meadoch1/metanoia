defmodule Metanoia.MentoringView do
  use Metanoia.Web, :view

  def render("index.json",
             %{mentor_groups: mentor_groups}) do
    %{
      mentor_groups: render_many(mentor_groups, Metanoia.MentorGroupView, "mentor_group.json"),
    }
  end

  def render("show.json", %{mentoring: mentoring, groups: groups}) do
    %{data: render_one(mentoring, Metanoia.MentoringView, "mentoring.json")}
  end

  def render("mentoring.json", %{mentoring: mentoring}) do
    mentoring
  end
end
