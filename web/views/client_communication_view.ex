defmodule Metanoia.ClientCommunicationView do
  use Metanoia.Web, :view

  def render("index.json", %{client_communications: client_communications}) do
    %{data: render_many(client_communications, Metanoia.ClientCommunicationView, "client_communication.json")}
  end

  def render("show.json", %{client_communication: client_communication}) do
    %{data: render_one(client_communication, Metanoia.ClientCommunicationView, "client_communication.json")}
  end

  def render("client_communication.json", %{client_communication: client_communication}) do
    %{id: client_communication.id,
      client_id: client_communication.client_id,
      client_communication_type_id: client_communication.client_communication_type_id,
      sent_dt: client_communication.sent_dt,
      note: client_communication.note}
  end
end
