defmodule Metanoia.MentorGroupView do
  use Metanoia.Web, :view
  use Metanoia.RelationRender

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
      facility_id: mentor_group.facility_id
     }
    |> render_relation( :facility, mentor_group.facility, Metanoia.FacilityView, "facility.json")
    |> render_relations( :schedule_entries, mentor_group.schedule_entries, Metanoia.ScheduleEntryView, "schedule_entry.json")
    |> render_relations( :mentor_group_assignments, mentor_group.mentor_group_assignments, Metanoia.MentorGroupAssignmentView, "mentor_group_assignment.json")
  end
  def render("mentor_group_with_info.json", %{mentor_group: mentor_group}) do
    %{id: mentor_group.id,
      name: mentor_group.name,
      leader_id: mentor_group.leader_id,
      facility_id: mentor_group.facility_id
     }
    |> render_relation( :facility, mentor_group.facility, Metanoia.FacilityView, "facility.json")
    |> render_relation( :schedule_entries, mentor_group.schedule_entries, Metanoia.ScheduleEntryView, "schedule_entry.json")
    |> render_relation( :mentor_group_assignments, mentor_group.mentor_group_assignments, Metanoia.MentorGroupAssignmentView, "mentor_group_assignment.json")
  end
end
