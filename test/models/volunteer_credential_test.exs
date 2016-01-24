defmodule Metanoia.VolunteerCredentialTest do
  use Metanoia.ModelCase

  alias Metanoia.VolunteerCredential

  @valid_attrs %{comment: "some content", credential_cd: "some content", expiration_dt: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VolunteerCredential.changeset(%VolunteerCredential{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VolunteerCredential.changeset(%VolunteerCredential{}, @invalid_attrs)
    refute changeset.valid?
  end
end
