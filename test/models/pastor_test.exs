defmodule Metanoia.PastorTest do
  use Metanoia.ModelCase

  alias Metanoia.Pastor

  @valid_attrs %{is_head: true, is_primary: true}
  @invalid_attrs %{is_head: "foo"}

  test "changeset with valid attributes" do
    changeset = Pastor.changeset(%Pastor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pastor.changeset(%Pastor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
