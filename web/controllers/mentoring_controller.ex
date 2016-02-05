defmodule Metanoia.MentoringController do
  use Metanoia.Web, :controller

  alias Metanoia.ClientVolunteerAssignment
  alias Metanoia.MentorGroup

  plug :scrub_params, "mentoring" when action in [:create, :update]

  def index(conn, _params) do
    groups = MentorGroup
      |> MentorGroup.include_all_info
      |> Repo.all

    render(conn, "index.json",
           mentor_groups: groups
    )
  end

end
