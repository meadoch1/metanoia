defmodule Metanoia.ClientCommunicationTest do
  use Metanoia.ModelCase

  alias Metanoia.ClientCommunication

  @valid_attrs %{note: "some content", sent_dt: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ClientCommunication.changeset(%ClientCommunication{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ClientCommunication.changeset(%ClientCommunication{}, @invalid_attrs)
    refute changeset.valid?
  end
end
