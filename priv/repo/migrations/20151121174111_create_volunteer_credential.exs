defmodule Metanoia.Repo.Migrations.CreateVolunteerCredential do
  use Ecto.Migration

  def change do
    create table(:volunteer_credentials) do
      add :credential_cd, :string
      add :expiration_dt, :date
      add :comment, :string
      add :volunteer_id, references(:volunteers)
      add :facility_id, references(:facilities)

      timestamps
    end
    create index(:volunteer_credentials, [:volunteer_id])
    create index(:volunteer_credentials, [:facility_id])

  end
end
