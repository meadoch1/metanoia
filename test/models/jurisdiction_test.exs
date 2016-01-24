defmodule Metanoia.JurisdictionTest do
  use Metanoia.ModelCase

  alias Metanoia.Jurisdiction

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Jurisdiction.changeset(%Jurisdiction{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Jurisdiction.changeset(%Jurisdiction{}, @invalid_attrs)
    refute changeset.valid?
  end
end
