defmodule Metanoia.MentorGroupReportDetailTest do
  use Metanoia.ModelCase

  alias Metanoia.MentorGroupReportDetail

  @valid_attrs %{note: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MentorGroupReportDetail.changeset(%MentorGroupReportDetail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MentorGroupReportDetail.changeset(%MentorGroupReportDetail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
