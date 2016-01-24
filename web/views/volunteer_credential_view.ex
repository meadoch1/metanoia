defmodule Metanoia.VolunteerCredentialView do
  use Metanoia.Web, :view

  def render("index.json", %{volunteer_credentials: volunteer_credentials}) do
    %{data: render_many(volunteer_credentials, Metanoia.VolunteerCredentialView, "volunteer_credential.json")}
  end

  def render("show.json", %{volunteer_credential: volunteer_credential}) do
    %{data: render_one(volunteer_credential, Metanoia.VolunteerCredentialView, "volunteer_credential.json")}
  end

  def render("volunteer_credential.json", %{volunteer_credential: volunteer_credential}) do
    %{id: volunteer_credential.id,
      credential_cd: volunteer_credential.credential_cd,
      expiration_dt: volunteer_credential.expiration_dt,
      comment: volunteer_credential.comment,
      volunteer_id: volunteer_credential.volunteer_id,
      facility_id: volunteer_credential.facility_id}
  end
end
