defmodule Metanoia.AddressTypeView do
  use Metanoia.Web, :view

  def render("index.json", %{address_types: address_types}) do
    %{data: render_many(address_types, Metanoia.AddressTypeView, "address_type.json")}
  end

  def render("show.json", %{address_type: address_type}) do
    %{data: render_one(address_type, Metanoia.AddressTypeView, "address_type.json")}
  end

  def render("address_type.json", %{address_type: address_type}) do
    %{id: address_type.id,
      name: address_type.name}
  end
end
