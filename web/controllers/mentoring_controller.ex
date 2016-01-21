defmodule Metanoia.MentoringController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientVolunteerAssignment
  alias Metanoia.MentorGroup

  plug :scrub_params, "mentoring" when action in [:create, :update]

  def index(conn, _params) do
    mentoring = ClientVolunteerAssignment
      |> ClientVolunteerAssignment.mentoring_info
      |> Repo.all
    groups = MentorGroup
      |> MentorGroup.display_info
      |> Repo.all

    render(conn, "index.json", mentoring: mentoring, groups: groups)
  end

end
