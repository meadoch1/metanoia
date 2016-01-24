defmodule Metanoia.ClientVolunteerAssignmentTest do
  use Metanoia.ModelCase

  alias Metanoia.ClientVolunteerAssignment

  @valid_attrs %{}
  @invalid_attrs %{start_month: 'abc'}

  test "changeset with valid attributes" do
    changeset = ClientVolunteerAssignment.changeset(%ClientVolunteerAssignment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ClientVolunteerAssignment.changeset(%ClientVolunteerAssignment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
