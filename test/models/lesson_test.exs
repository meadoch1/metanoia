defmodule Metanoia.LessonTest do
  use Metanoia.ModelCase

  alias Metanoia.Lesson

  @valid_attrs %{booklet: true, description: "some content", name: "some content", order_nr: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Lesson.changeset(%Lesson{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Lesson.changeset(%Lesson{}, @invalid_attrs)
    refute changeset.valid?
  end
end
