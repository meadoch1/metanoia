defmodule Metanoia.SecurityLevelTest do
  use Metanoia.ModelCase

  alias Metanoia.SecurityLevel

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SecurityLevel.changeset(%SecurityLevel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SecurityLevel.changeset(%SecurityLevel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
