defmodule Metanoia.VolunteerProgramAssignmentView do
  use Metanoia.Web, :view

  def render("index.json", %{volunteer_program_assignments: volunteer_program_assignments}) do
    %{data: render_many(volunteer_program_assignments, Metanoia.VolunteerProgramAssignmentView, "volunteer_program_assignment.json")}
  end

  def render("show.json", %{volunteer_program_assignment: volunteer_program_assignment}) do
    %{data: render_one(volunteer_program_assignment, Metanoia.VolunteerProgramAssignmentView, "volunteer_program_assignment.json")}
  end

  def render("volunteer_program_assignment.json", %{volunteer_program_assignment: volunteer_program_assignment}) do
    %{id: volunteer_program_assignment.id,
      volunteer_id: volunteer_program_assignment.volunteer_id,
      program_id: volunteer_program_assignment.program_id}
  end
end
