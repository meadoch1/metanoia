defmodule Metanoia.CourseTest do
  use Metanoia.ModelCase

  alias Metanoia.Course

  @valid_attrs %{description: "some content", level: "some content", name: "some content", order_nr: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Course.changeset(%Course{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Course.changeset(%Course{}, @invalid_attrs)
    refute changeset.valid?
  end
end
