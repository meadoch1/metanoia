defmodule Metanoia.PersonTest do
  use Metanoia.ModelCase

  alias Metanoia.Person

  @valid_attrs %{dob: "2010-04-17", email: "some content", email2: "some content", first_name: "some content", last_name: "some content", middle_name: "some content", mobile_phone: "some content", nickname: "some content", phone: "some content", spouse_name: "some content", suffix: "some content", work_phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Person.changeset(%Person{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end
