defmodule Metanoia.ScheduleEntryTest do
  use Metanoia.ModelCase

  alias Metanoia.ScheduleEntry

  @valid_attrs %{day_of_week: 42, week_of_month: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ScheduleEntry.changeset(%ScheduleEntry{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ScheduleEntry.changeset(%ScheduleEntry{}, @invalid_attrs)
    refute changeset.valid?
  end
end
