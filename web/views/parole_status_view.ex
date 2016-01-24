defmodule Metanoia.ParoleStatusView do
  use Metanoia.Web, :view

  def render("index.json", %{parole_status: parole_status}) do
    %{data: render_many(parole_status, Metanoia.ParoleStatusView, "parole_status.json")}
  end

  def render("show.json", %{parole_status: parole_status}) do
    %{data: render_one(parole_status, Metanoia.ParoleStatusView, "parole_status.json")}
  end

  def render("parole_status.json", %{parole_status: parole_status}) do
    %{id: parole_status.id,
      name: parole_status.name}
  end
end
