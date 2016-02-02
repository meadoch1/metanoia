defmodule Metanoia.MentoringView do
  use Metanoia.Web, :view

  def render("index.json",
             %{mentor_groups: mentor_groups, volunteers: volunteers, clients: clients, schedules: schedules, group_assignments: group_assignments }) do
    %{
      # group_assignments: render_many(group_assignments, Metanoia.ClientVolunteerAssignmentView, "client_volunteer_assignment.json"),
      mentor_groups: render_many(mentor_groups, Metanoia.MentorGroupView, "mentor_group.json"),
      # volunteers: render_many(volunteers, Metanoia.VolunteerView, "volunteer.json"),
      # clients: render_many(clients, Metanoia.ClientView, "client.json"),
      # schedules: render_many(schedules, Metanoia.ScheduleEntryView, "schedule_entry.json"),
      # group_assignments: render_many(group_assignments, Metanoia.MentorGroupAssignmentView, "mentor_group_assignment.json")
    }
  end

  def render("show.json", %{mentoring: mentoring, groups: groups}) do
    %{data: render_one(mentoring, Metanoia.MentoringView, "mentoring.json")}
  end

  def render("mentoring.json", %{mentoring: mentoring}) do
    mentoring
    # %{id: mentor_group.id, name: mentor_group.name, facility_id: mentor_group.facility_id, mentors: []}
  end
end
