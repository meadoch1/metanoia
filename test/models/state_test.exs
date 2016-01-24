defmodule Metanoia.StateTest do
  use Metanoia.ModelCase

  alias Metanoia.State

  @valid_attrs %{abbreviation: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = State.changeset(%State{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = State.changeset(%State{}, @invalid_attrs)
    refute changeset.valid?
  end
end
