defmodule Metanoia.StateView do
  use Metanoia.Web, :view

  def render("index.json", %{states: states}) do
    %{data: render_many(states, Metanoia.StateView, "state.json")}
  end

  def render("show.json", %{state: state}) do
    %{data: render_one(state, Metanoia.StateView, "state.json")}
  end

  def render("state.json", %{state: state}) do
    %{id: state.id,
      name: state.name,
      abbreviation: state.abbreviation}
  end
end
