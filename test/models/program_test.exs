defmodule Metanoia.ProgramTest do
  use Metanoia.ModelCase

  alias Metanoia.Program

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Program.changeset(%Program{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Program.changeset(%Program{}, @invalid_attrs)
    refute changeset.valid?
  end
end
