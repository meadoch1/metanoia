defmodule Metanoia.MentorGroupReportTest do
  use Metanoia.ModelCase

  alias Metanoia.MentorGroupReport

  @valid_attrs %{meeting_dt: "2010-04-17", note: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MentorGroupReport.changeset(%MentorGroupReport{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MentorGroupReport.changeset(%MentorGroupReport{}, @invalid_attrs)
    refute changeset.valid?
  end
end
