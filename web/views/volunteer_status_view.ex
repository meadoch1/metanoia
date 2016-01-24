defmodule Metanoia.VolunteerStatusView do
  use Metanoia.Web, :view

  def render("index.json", %{volunteer_status: volunteer_status}) do
    %{data: render_many(volunteer_status, Metanoia.VolunteerStatusView, "volunteer_status.json")}
  end

  def render("show.json", %{volunteer_status: volunteer_status}) do
    %{data: render_one(volunteer_status, Metanoia.VolunteerStatusView, "volunteer_status.json")}
  end

  def render("volunteer_status.json", %{volunteer_status: volunteer_status}) do
    %{id: volunteer_status.id,
      name: volunteer_status.name}
  end
end
