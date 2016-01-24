defmodule Metanoia.AddressTest do
  use Metanoia.ModelCase

  alias Metanoia.Address

  @valid_attrs %{city: "some content", latitude: "120.5", line1: "some content", line2: "some content", longitude: "120.5", zip_code: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
