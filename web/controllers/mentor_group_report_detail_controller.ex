defmodule Metanoia.MentorGroupReportDetailController do
  use Metanoia.Web, :controller

  alias Metanoia.MentorGroupReportDetail

  plug :scrub_params, "mentor_group_report_detail" when action in [:create, :update]

  def index(conn, _params) do
    mentor_group_report_details = Repo.all(MentorGroupReportDetail)
    render(conn, "index.json", mentor_group_report_details: mentor_group_report_details)
  end

  def create(conn, %{"mentor_group_report_detail" => mentor_group_report_detail_params}) do
    changeset = MentorGroupReportDetail.changeset(%MentorGroupReportDetail{}, mentor_group_report_detail_params)

    case Repo.insert(changeset) do
      {:ok, mentor_group_report_detail} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", mentor_group_report_detail_path(conn, :show, mentor_group_report_detail))
        |> render("show.json", mentor_group_report_detail: mentor_group_report_detail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mentor_group_report_detail = Repo.get!(MentorGroupReportDetail, id)
    render(conn, "show.json", mentor_group_report_detail: mentor_group_report_detail)
  end

  def update(conn, %{"id" => id, "mentor_group_report_detail" => mentor_group_report_detail_params}) do
    mentor_group_report_detail = Repo.get!(MentorGroupReportDetail, id)
    changeset = MentorGroupReportDetail.changeset(mentor_group_report_detail, mentor_group_report_detail_params)

    case Repo.update(changeset) do
      {:ok, mentor_group_report_detail} ->
        render(conn, "show.json", mentor_group_report_detail: mentor_group_report_detail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Metanoia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mentor_group_report_detail = Repo.get!(MentorGroupReportDetail, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mentor_group_report_detail)

    send_resp(conn, :no_content, "")
  end
end
