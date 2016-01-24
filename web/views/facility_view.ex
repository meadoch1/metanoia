defmodule Metanoia.FacilityView do
  use Metanoia.Web, :view

  def render("index.json", %{facilities: facilities}) do
    %{data: render_many(facilities, Metanoia.FacilityView, "facility.json")}
  end

  def render("show.json", %{facility: facility}) do
    %{data: render_one(facility, Metanoia.FacilityView, "facility.json")}
  end

  def render("facility.json", %{facility: facility}) do
    %{id: facility.id,
      name: facility.name,
      address_id: facility.address_id,
      courier: facility.courier,
      warden_id: facility.warden_id,
      chaplain_id: facility.chaplain_id,
      jurisdiction_id: facility.jurisdiction_id,
      security_level_id: facility.security_level_id,
      avg_daily_pop: facility.avg_daily_pop,
      pop_gender_id: facility.pop_gender_id,
      resident_address_id: facility.resident_address_id}
  end
end
