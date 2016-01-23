defmodule Metanoia.AddressTypeView do
  use Metanoia.Web, :view

  @attributes ~W( id name inserted_at updated_at)a

  def render("address_type.json", %{address_type: data}) do
    data
    |> Map.take(@attributes)
  end

end
