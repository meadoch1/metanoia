defmodule Metanoia.RelationshipPreferenceView do
  use Metanoia.Web, :view

  def render("index.json", %{relationship_preferences: relationship_preferences}) do
    %{data: render_many(relationship_preferences, Metanoia.RelationshipPreferenceView, "relationship_preference.json")}
  end

  def render("show.json", %{relationship_preference: relationship_preference}) do
    %{data: render_one(relationship_preference, Metanoia.RelationshipPreferenceView, "relationship_preference.json")}
  end

  def render("relationship_preference.json", %{relationship_preference: relationship_preference}) do
    %{id: relationship_preference.id,
      name: relationship_preference.name}
  end
end
