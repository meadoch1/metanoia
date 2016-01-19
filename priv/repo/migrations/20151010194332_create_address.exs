defmodule Metanoia.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :line1, :string
      add :line2, :string
      add :city, :string
      add :zip_code, :string
      add :latitude, :float
      add :longitude, :float
      add :address_type_id, references(:address_types)
      add :state_id, references(:states)

      timestamps
    end
    create index(:addresses, [:address_type_id])
    create index(:addresses, [:state_id])

  end
end
