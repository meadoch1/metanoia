defmodule Metanoia.ClientCommunicationTypeTest do
  use Metanoia.ModelCase

  alias Metanoia.ClientCommunicationType

  @valid_attrs %{contents: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ClientCommunicationType.changeset(%ClientCommunicationType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ClientCommunicationType.changeset(%ClientCommunicationType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
