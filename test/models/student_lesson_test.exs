defmodule Metanoia.StudentLessonTest do
  use Metanoia.ModelCase

  alias Metanoia.StudentLesson

  @valid_attrs %{grade: "120.5", received_dt: "2010-04-17", sent_dt: "2010-04-17", lesson_id: 1, student_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = StudentLesson.changeset(%StudentLesson{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = StudentLesson.changeset(%StudentLesson{}, @invalid_attrs)
    refute changeset.valid?
  end
end
