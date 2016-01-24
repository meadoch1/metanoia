defmodule Metanoia.JurisdictionView do
  use Metanoia.Web, :view

  def render("index.json", %{jurisdictions: jurisdictions}) do
    %{data: render_many(jurisdictions, Metanoia.JurisdictionView, "jurisdiction.json")}
  end

  def render("show.json", %{jurisdiction: jurisdiction}) do
    %{data: render_one(jurisdiction, Metanoia.JurisdictionView, "jurisdiction.json")}
  end

  def render("jurisdiction.json", %{jurisdiction: jurisdiction}) do
    %{id: jurisdiction.id,
      name: jurisdiction.name}
  end
end
