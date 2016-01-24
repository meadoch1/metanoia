defmodule Metanoia.DenominationTest do
  use Metanoia.ModelCase

  alias Metanoia.Denomination

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Denomination.changeset(%Denomination{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Denomination.changeset(%Denomination{}, @invalid_attrs)
    refute changeset.valid?
  end
end
