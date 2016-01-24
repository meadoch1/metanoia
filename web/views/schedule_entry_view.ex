defmodule Metanoia.ScheduleEntryView do
  use Metanoia.Web, :view

  def render("index.json", %{schedule_entries: schedule_entries}) do
    %{data: render_many(schedule_entries, Metanoia.ScheduleEntryView, "schedule_entry.json")}
  end

  def render("show.json", %{schedule_entry: schedule_entry}) do
    %{data: render_one(schedule_entry, Metanoia.ScheduleEntryView, "schedule_entry.json")}
  end

  def render("schedule_entry.json", %{schedule_entry: schedule_entry}) do
    %{id: schedule_entry.id,
      day_of_week: schedule_entry.day_of_week,
      week_of_month: schedule_entry.week_of_month,
      mentor_group_id: schedule_entry.mentor_group_id}
  end
end
