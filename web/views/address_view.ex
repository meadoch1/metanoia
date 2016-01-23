defmodule Metanoia.AddressView do
  use Metanoia.Web, :view

  @attributes ~W(id line1 line2 city zip_code latitude longitude address_type_id
                 state_id inserted_at updated_at)a

  def render("address.json", %{address: address}) do
    address
    |> Map.take(@attributes)
    |> Map.put( :state, render_one(address.state, Metanoia.StateView, "state.json"))
    |> Map.put( :address_type, render_one(address.address_type, Metanoia.AddressTypeView, "address_type.json"))
  end

end
