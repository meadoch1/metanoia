defmodule Metanoia.PersonView do
  use Metanoia.Web, :view

  @attributes ~W(id first_name last_name middle_name phone mobile_phone email dob address_id church_id
                 inserted_at updated_at pastor_id work_phone spouse_name email2 nickname suffix)a
  def render("person.json", %{person: person}) do
    person
    |> Map.take(@attributes)
    |> Map.put(:address, render_one( person.address, Metanoia.AddressView, "address.json"))
  end

end
