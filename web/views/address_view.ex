defmodule Metanoia.AddressView do
  use Metanoia.Web, :view

  def render("index.json", %{addresses: addresses}) do
    %{data: render_many(addresses, Metanoia.AddressView, "address.json")}
  end

  def render("show.json", %{address: address}) do
    %{data: render_one(address, Metanoia.AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{id: address.id,
      address_type_id: address.address_type_id,
      line1: address.line1,
      line2: address.line2,
      city: address.city,
      state_id: address.state_id,
      zip_code: address.zip_code,
      latitude: address.latitude,
      longitude: address.longitude}
    |> Map.put( :state, render_one(address.state, Metanoia.StateView, "state.json"))
    |> Map.put( :address_type, render_one(address.address_type, Metanoia.AddressTypeView, "address_type.json"))
  end
end
