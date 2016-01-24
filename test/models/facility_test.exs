defmodule Metanoia.FacilityTest do
  use Metanoia.ModelCase

  alias Metanoia.Facility

  @valid_attrs %{avg_daily_pop: 42, courier: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Facility.changeset(%Facility{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Facility.changeset(%Facility{}, @invalid_attrs)
    refute changeset.valid?
  end
end
