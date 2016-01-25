defmodule Metanoia.PersonView do
  use Metanoia.Web, :view
  use Metanoia.RelationRender

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, Metanoia.PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, Metanoia.PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      first_name: person.first_name,
      last_name: person.last_name,
      middle_name: person.middle_name,
      address_id: person.address_id,
      phone: person.phone,
      mobile_phone: person.mobile_phone,
      email: person.email,
      church_id: person.church_id,
      pastor_id: person.pastor_id,
      dob: person.dob,
      pastor_id: person.pastor_id,
      work_phone: person.work_phone,
      spouse_name: person.spouse_name,
      email2: person.email2,
      nickname: person.nickname,
      suffix: person.suffix}
    |> render_relation( :address, person.address, Metanoia.AddressView, "address.json")
  end

  # def render_address(map, %Ecto.Association.NotLoaded{}) do
  #   map
  # end

  # def render_address(map, address) do
  #   Map.put(map, :address, render_one(address, Metanoia.AddressView, "address.json"))
  # end

end
