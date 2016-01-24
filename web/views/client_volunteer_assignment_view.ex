defmodule Metanoia.ClientVolunteerAssignmentView do
  use Metanoia.Web, :view

  def render("index.json", %{client_volunteer_assignments: client_volunteer_assignments}) do
    %{data: render_many(client_volunteer_assignments, Metanoia.ClientVolunteerAssignmentView, "client_volunteer_assignment.json")}
  end

  def render("show.json", %{client_volunteer_assignment: client_volunteer_assignment}) do
    %{data: render_one(client_volunteer_assignment, Metanoia.ClientVolunteerAssignmentView, "client_volunteer_assignment.json")}
  end

  def render("client_volunteer_assignment.json", %{client_volunteer_assignment: client_volunteer_assignment}) do
    %{id: client_volunteer_assignment.id,
      client_id: client_volunteer_assignment.client_id,
      program_id: client_volunteer_assignment.program_id,
      volunteer_id: client_volunteer_assignment.volunteer_id}
  end
end
