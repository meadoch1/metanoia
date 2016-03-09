defmodule Metanoia.MentorGroupReportController do
  use Metanoia.Web, :controller

  alias Metanoia.MentorGroupReport

  plug :scrub_params, "mentor_group_report" when action in [:create, :update]

  def index(conn, %{"latest" => "1", "mentor_group_id" => mentor_group_id}) do
    last_date = Metanoia.MentorGroup.last_meeting_date(mentor_group_id)

    query = MentorGroupReport
    |> MentorGroupReport.latest_for_group(mentor_group_id, last_date) 

    mentor_group_reports = case Repo.all(query) do
      [] ->
        changeset = MentorGroupReport.changeset(%MentorGroupReport{},
                                                %{
                                                  "mentor_group_id" => mentor_group_id,
                                                  "meeting_dt" => last_date
                                                })
        {:ok, mentor_group_report} = Repo.insert(changeset)
        [mentor_group_report]
      [h|t] ->
        [h|t]
    end
    
    render(conn, "index.json", mentor_group_reports: mentor_group_reports)
  end

  def index(conn, params) do
    # inspect params and if latest == "1" then check if there is one for the last meeting date
    #   if there is, return it
    #   if there is not, create one then return it
    mentor_group_reports = Repo.all(MentorGroupReport)
    render(conn, "index.json", mentor_group_reports: mentor_group_reports)
  end

  def create(conn, %{"mentor_group_report" => mentor_group_report_params}) do
    changeset = MentorGroupReport.changeset(%MentorGroupReport{}, mentor_group_report_params)

    case Repo.insert(changeset) do
      {:ok, mentor_group_report} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", mentor_group_report_path(conn, :show, mentor_group_report))
        |> render("show.json", mentor_group_report: mentor_group_report)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mentor_group_report = Repo.get!(MentorGroupReport, id)
    render(conn, "show.json", mentor_group_report: mentor_group_report)
  end

  def update(conn, %{"id" => id, "mentor_group_report" => mentor_group_report_params}) do
    mentor_group_report = Repo.get!(MentorGroupReport, id)
    changeset = MentorGroupReport.changeset(mentor_group_report, mentor_group_report_params)

    case Repo.update(changeset) do
      {:ok, mentor_group_report} ->
        render(conn, "show.json", mentor_group_report: mentor_group_report)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mentor_group_report = Repo.get!(MentorGroupReport, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mentor_group_report)

    send_resp(conn, :no_content, "")
  end
end
