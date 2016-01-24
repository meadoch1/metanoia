defmodule Metanoia.ClientCommunicationTypeView do
  use Metanoia.Web, :view

  def render("index.json", %{client_commmunication_types: client_commmunication_types}) do
    %{data: render_many(client_commmunication_types, Metanoia.ClientCommunicationTypeView, "client_communication_type.json")}
  end

  def render("show.json", %{client_communication_type: client_communication_type}) do
    %{data: render_one(client_communication_type, Metanoia.ClientCommunicationTypeView, "client_communication_type.json")}
  end

  def render("client_communication_type.json", %{client_communication_type: client_communication_type}) do
    %{id: client_communication_type.id,
      name: client_communication_type.name,
      contents: client_communication_type.contents}
  end
end
