defmodule Metanoia.SecurityLevelView do
  use Metanoia.Web, :view

  def render("index.json", %{security_levels: security_levels}) do
    %{data: render_many(security_levels, Metanoia.SecurityLevelView, "security_level.json")}
  end

  def render("show.json", %{security_level: security_level}) do
    %{data: render_one(security_level, Metanoia.SecurityLevelView, "security_level.json")}
  end

  def render("security_level.json", %{security_level: security_level}) do
    %{id: security_level.id,
      name: security_level.name}
  end
end
