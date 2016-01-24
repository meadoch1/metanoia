defmodule Metanoia.PresbyteryView do
  use Metanoia.Web, :view

  def render("index.json", %{presbyteries: presbyteries}) do
    %{data: render_many(presbyteries, Metanoia.PresbyteryView, "presbytery.json")}
  end

  def render("show.json", %{presbytery: presbytery}) do
    %{data: render_one(presbytery, Metanoia.PresbyteryView, "presbytery.json")}
  end

  def render("presbytery.json", %{presbytery: presbytery}) do
    %{id: presbytery.id,
      name: presbytery.name}
  end
end
