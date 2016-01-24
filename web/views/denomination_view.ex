defmodule Metanoia.DenominationView do
  use Metanoia.Web, :view

  def render("index.json", %{denominations: denominations}) do
    %{data: render_many(denominations, Metanoia.DenominationView, "denomination.json")}
  end

  def render("show.json", %{denomination: denomination}) do
    %{data: render_one(denomination, Metanoia.DenominationView, "denomination.json")}
  end

  def render("denomination.json", %{denomination: denomination}) do
    %{id: denomination.id,
      name: denomination.name}
  end
end
