defmodule Metanoia.MentorGroupTest do
  use Metanoia.ModelCase

  alias Metanoia.MentorGroup

  @valid_attrs %{name: "some content", facility_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MentorGroup.changeset(%MentorGroup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MentorGroup.changeset(%MentorGroup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
