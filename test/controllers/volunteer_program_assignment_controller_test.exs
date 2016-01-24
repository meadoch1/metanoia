defmodule Metanoia.VolunteerProgramAssignmentControllerTest do
  use Metanoia.ConnCase

  alias Metanoia.VolunteerProgramAssignment
  @valid_attrs %{ volunteer_id: 1,  program_id: 1 }
  @invalid_attrs %{}

  def valid_attrs_with_fks do
    vol = Repo.insert! %Metanoia.Volunteer{}
    program = Repo.insert! %Metanoia.Program{}
    @valid_attrs
    |> Map.put(:volunteer_id, vol.id)
    |> Map.put(:program_id, program.id)
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, volunteer_program_assignment_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    volunteer_program_assignment = Repo.insert! %VolunteerProgramAssignment{}
    conn = get conn, volunteer_program_assignment_path(conn, :show, volunteer_program_assignment)
    assert json_response(conn, 200)["data"] == %{"id" => volunteer_program_assignment.id,
      "volunteer_id" => volunteer_program_assignment.volunteer_id,
      "program_id" => volunteer_program_assignment.program_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, volunteer_program_assignment_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    attrs = valid_attrs_with_fks
    conn = post conn, volunteer_program_assignment_path(conn, :create), volunteer_program_assignment: attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(VolunteerProgramAssignment, attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, volunteer_program_assignment_path(conn, :create), volunteer_program_assignment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    attrs = valid_attrs_with_fks
    volunteer_program_assignment = Repo.insert! %VolunteerProgramAssignment{}
    conn = put conn, volunteer_program_assignment_path(conn, :update, volunteer_program_assignment), volunteer_program_assignment: attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(VolunteerProgramAssignment, attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    volunteer_program_assignment = Repo.insert! %VolunteerProgramAssignment{}
    conn = put conn, volunteer_program_assignment_path(conn, :update, volunteer_program_assignment), volunteer_program_assignment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    volunteer_program_assignment = Repo.insert! %VolunteerProgramAssignment{}
    conn = delete conn, volunteer_program_assignment_path(conn, :delete, volunteer_program_assignment)
    assert response(conn, 204)
    refute Repo.get(VolunteerProgramAssignment, volunteer_program_assignment.id)
  end
end
