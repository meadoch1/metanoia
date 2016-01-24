defmodule Metanoia.ClientStatusTest do
  use Metanoia.ModelCase

  alias Metanoia.ClientStatus

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ClientStatus.changeset(%ClientStatus{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ClientStatus.changeset(%ClientStatus{}, @invalid_attrs)
    refute changeset.valid?
  end
end
