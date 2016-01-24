defmodule Metanoia.MentorGroupView do
  use Metanoia.Web, :view

  def render("index.json", %{mentor_groups: mentor_groups}) do
    %{data: render_many(mentor_groups, Metanoia.MentorGroupView, "mentor_group.json")}
  end

  def render("show.json", %{mentor_group: mentor_group}) do
    %{data: render_one(mentor_group, Metanoia.MentorGroupView, "mentor_group.json")}
  end

  def render("mentor_group.json", %{mentor_group: mentor_group}) do
    %{id: mentor_group.id,
      name: mentor_group.name,
      leader_id: mentor_group.leader_id,
      facility_id: mentor_group.facility_id}
  end
end
