defmodule Metanoia.RelationshipPreferenceTest do
  use Metanoia.ModelCase

  alias Metanoia.RelationshipPreference

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RelationshipPreference.changeset(%RelationshipPreference{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RelationshipPreference.changeset(%RelationshipPreference{}, @invalid_attrs)
    refute changeset.valid?
  end
end
