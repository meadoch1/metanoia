defmodule Metanoia.VolunteerStatusTest do
  use Metanoia.ModelCase

  alias Metanoia.VolunteerStatus

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VolunteerStatus.changeset(%VolunteerStatus{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VolunteerStatus.changeset(%VolunteerStatus{}, @invalid_attrs)
    refute changeset.valid?
  end
end
