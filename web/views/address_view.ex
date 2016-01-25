defmodule Metanoia.AddressView do
  use Metanoia.Web, :view
  use Metanoia.RelationRender

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
    |> render_relation( :state, address.state, Metanoia.StateView, "state.json")
    |> render_relation( :address_type, address.address_type, Metanoia.AddressTypeView, "address_type.json")
  end

  # def render_relation(map, _key, %Ecto.Association.NotLoaded{}, _view, _name) do
  #   map
  # end

  # def render_relation(map, key, relation, view, name) do
  #   Map.put(map, key, render_one(relation, view, name))
  # end

end
