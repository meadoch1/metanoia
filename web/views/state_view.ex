defmodule Metanoia.StateView do
  use Metanoia.Web, :view

  @attributes ~W(id name abbreviation inserted_at updated_at)a

  def render("state.json", %{state: data}) do
    data
    |> Map.take(@attributes)
  end

end
