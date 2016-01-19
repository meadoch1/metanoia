defmodule Metanoia.Repo.Migrations.AddResidentAddressIdToFacility do
  use Ecto.Migration

  def change do
    alter table(:facilities) do
      add :resident_address_id, references(:addresses)
    end
    create index(:facilities, [:resident_address_id])
  end
end
