defmodule Metanoia.MentorGroupReportView do
  use Metanoia.Web, :view
  use Metanoia.RelationRender

  def render("index.json", %{mentor_group_reports: mentor_group_reports}) do
    %{mentor_group_reports: render_many(mentor_group_reports, Metanoia.MentorGroupReportView, "mentor_group_report.json")}
  end

  def render("show.json", %{mentor_group_report: mentor_group_report}) do
    %{data: render_one(mentor_group_report, Metanoia.MentorGroupReportView, "mentor_group_report.json")}
  end

  def render("mentor_group_report.json", %{mentor_group_report: mentor_group_report}) do
    %{id: mentor_group_report.id,
      meeting_dt: mentor_group_report.meeting_dt,
      mentor_group_id: mentor_group_report.mentor_group_id,
      note: mentor_group_report.note}
    |> render_relations( :mentor_group_report_details, mentor_group_report.mentor_group_report_details, Metanoia.MentorGroupReportDetailView, "mentor_group_report_detail.json")
  end
end
