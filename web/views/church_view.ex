defmodule Metanoia.ChurchView do
  use Metanoia.Web, :view

  def render("index.json", %{churches: churches}) do
    %{data: render_many(churches, Metanoia.ChurchView, "church.json")}
  end

  def render("show.json", %{church: church}) do
    %{data: render_one(church, Metanoia.ChurchView, "church.json")}
  end

  def render("church.json", %{church: church}) do
    %{id: church.id,
      name: church.name,
      address_id: church.address_id,
      phone: church.phone,
      denomination_id: church.denomination_id,
      presbytery_id: church.presbytery_id,
      one_time_support: church.one_time_support,
      ongoing_support: church.ongoing_support,
      prayer_support: church.prayer_support,
      newsletter: church.newsletter}
  end
end
