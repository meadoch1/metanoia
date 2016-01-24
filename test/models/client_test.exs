defmodule Metanoia.ClientTest do
  use Metanoia.ModelCase

  alias Metanoia.Client

  @valid_attrs %{earliest_out_dt: "2010-04-17", facility_address_text: "some content", facility_ref_cd: "some content", grader_address_text: "some content", max_possible_release_dt: "2010-04-17", note: "some content", tentative_parole_month: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Client.changeset(%Client{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Client.changeset(%Client{}, @invalid_attrs)
    refute changeset.valid?
  end
end
