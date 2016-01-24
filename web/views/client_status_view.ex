defmodule Metanoia.ClientStatusView do
  use Metanoia.Web, :view

  def render("index.json", %{client_status: client_status}) do
    %{data: render_many(client_status, Metanoia.ClientStatusView, "client_status.json")}
  end

  def render("show.json", %{client_status: client_status}) do
    %{data: render_one(client_status, Metanoia.ClientStatusView, "client_status.json")}
  end

  def render("client_status.json", %{client_status: client_status}) do
    %{id: client_status.id,
      name: client_status.name}
  end
end
