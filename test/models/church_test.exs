defmodule Metanoia.ChurchTest do
  use Metanoia.ModelCase

  alias Metanoia.Church

  @valid_attrs %{name: "some content", newsletter: true, one_time_support: true, ongoing_support: true, phone: "some content", prayer_support: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Church.changeset(%Church{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Church.changeset(%Church{}, @invalid_attrs)
    refute changeset.valid?
  end
end
