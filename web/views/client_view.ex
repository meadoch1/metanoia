defmodule Metanoia.ClientView do
  use Metanoia.Web, :view

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, Metanoia.ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, Metanoia.ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id,
      person_id: client.person_id,
      facility_id: client.facility_id,
      facility_ref_cd: client.facility_ref_cd,
      earliest_out_dt: client.earliest_out_dt,
      client_status_id: client.client_status_id,
      note: client.note,
      facility_address_text: client.facility_address_text,
      grader_address_text: client.grader_address_text,
      parole_status_id: client.parole_status_id,
      tentative_parole_month: client.tentative_parole_month,
      max_possible_release_dt: client.max_possible_release_dt}
  end
end
