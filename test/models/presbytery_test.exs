defmodule Metanoia.PresbyteryTest do
  use Metanoia.ModelCase

  alias Metanoia.Presbytery

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Presbytery.changeset(%Presbytery{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Presbytery.changeset(%Presbytery{}, @invalid_attrs)
    refute changeset.valid?
  end
end
