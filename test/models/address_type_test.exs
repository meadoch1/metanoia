defmodule Metanoia.AddressTypeTest do
  use Metanoia.ModelCase

  alias Metanoia.AddressType

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AddressType.changeset(%AddressType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AddressType.changeset(%AddressType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
