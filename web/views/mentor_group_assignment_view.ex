defmodule Metanoia.MentorGroupAssignmentView do
  use Metanoia.Web, :view

  def render("index.json", %{mentor_group_assignments: mentor_group_assignments}) do
    %{data: render_many(mentor_group_assignments, Metanoia.MentorGroupAssignmentView, "mentor_group_assignment.json")}
  end

  def render("show.json", %{mentor_group_assignment: mentor_group_assignment}) do
    %{data: render_one(mentor_group_assignment, Metanoia.MentorGroupAssignmentView, "mentor_group_assignment.json")}
  end

  def render("mentor_group_assignment.json", %{mentor_group_assignment: mentor_group_assignment}) do
    %{id: mentor_group_assignment.id,
      mentor_group_id: mentor_group_assignment.mentor_group_id,
      volunteer_id: mentor_group_assignment.volunteer_id,
      comments: mentor_group_assignment.comments,
      start_month: mentor_group_assignment.start_month}
  end
end
