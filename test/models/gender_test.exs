defmodule Metanoia.GenderTest do
  use Metanoia.ModelCase

  alias Metanoia.Gender

  @valid_attrs %{code: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Gender.changeset(%Gender{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Gender.changeset(%Gender{}, @invalid_attrs)
    refute changeset.valid?
  end
end
