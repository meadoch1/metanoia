defmodule Metanoia.MentorGroupAssignmentTest do
  use Metanoia.ModelCase

  alias Metanoia.MentorGroupAssignment

  @valid_attrs %{comments: "some content", start_month: "2010-04-17"}
  @invalid_attrs %{comments: 123}

  test "changeset with valid attributes" do
    changeset = MentorGroupAssignment.changeset(%MentorGroupAssignment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MentorGroupAssignment.changeset(%MentorGroupAssignment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
