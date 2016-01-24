defmodule Metanoia.CurriculumTest do
  use Metanoia.ModelCase

  alias Metanoia.Curriculum

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Curriculum.changeset(%Curriculum{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Curriculum.changeset(%Curriculum{}, @invalid_attrs)
    refute changeset.valid?
  end
end
