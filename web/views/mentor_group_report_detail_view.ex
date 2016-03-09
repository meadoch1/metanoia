defmodule Metanoia.MentorGroupReportDetailView do
  use Metanoia.Web, :view

  def render("index.json", %{mentor_group_report_details: mentor_group_report_details}) do
    %{data: render_many(mentor_group_report_details, Metanoia.MentorGroupReportDetailView, "mentor_group_report_detail.json")}
  end

  def render("show.json", %{mentor_group_report_detail: mentor_group_report_detail}) do
    %{data: render_one(mentor_group_report_detail, Metanoia.MentorGroupReportDetailView, "mentor_group_report_detail.json")}
  end

  def render("mentor_group_report_detail.json", %{mentor_group_report_detail: mentor_group_report_detail}) do
    %{id: mentor_group_report_detail.id,
      mentor_group_report_id: mentor_group_report_detail.mentor_group_report_id,
      mentor_group_assignment_id: mentor_group_report_detail.mentor_group_assignment_id,
      status: mentor_group_report_detail.status,
      note: mentor_group_report_detail.note}
  end
end
