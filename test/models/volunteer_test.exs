defmodule Metanoia.VolunteerTest do
  use Metanoia.ModelCase

  alias Metanoia.Volunteer

  @valid_attrs %{mna_second_career: true, note: "some content"}
  @invalid_attrs %{mna_second_career: "foo"}

  test "changeset with valid attributes" do
    changeset = Volunteer.changeset(%Volunteer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Volunteer.changeset(%Volunteer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
