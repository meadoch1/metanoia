defmodule Metanoia.ParoleStatusTest do
  use Metanoia.ModelCase

  alias Metanoia.ParoleStatus

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ParoleStatus.changeset(%ParoleStatus{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ParoleStatus.changeset(%ParoleStatus{}, @invalid_attrs)
    refute changeset.valid?
  end
end
