defmodule Metanoia.VolunteerProgramAssignmentTest do
  use Metanoia.ModelCase

  alias Metanoia.VolunteerProgramAssignment

  @valid_attrs %{ volunteer_id: 1, program_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VolunteerProgramAssignment.changeset(%VolunteerProgramAssignment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VolunteerProgramAssignment.changeset(%VolunteerProgramAssignment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
