defmodule Metanoia.MentoringController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientVolunteerAssignment
  alias Metanoia.MentorGroup

  plug :scrub_params, "mentoring" when action in [:create, :update]

  def index(conn, _params) do
    volunteers = Metanoia.Volunteer
      # |> Metanoia.Volunteer.mentors
      |> Metanoia.Volunteer.include_all_info
      |> Repo.all
    clients = Metanoia.Client
      |> Metanoia.Client.include_all_info
      |> Repo.all
    mentoring = ClientVolunteerAssignment
      # |> ClientVolunteerAssignment.include_all_info
      # |> ClientVolunteerAssignment.mentoring_info
      |> Repo.all
    groups = MentorGroup
      |> MentorGroup.include_all_info
      |> Repo.all
    schedules = Metanoia.ScheduleEntry |> Repo.all
    group_assignments = Metanoia.MentorGroupAssignment |> Repo.all

    render(conn, "index.json",
           mentor_groups: groups,
           volunteers: volunteers,
           clients: clients,
           schedules: schedules,
           group_assignments: group_assignments
    )
  end

end
