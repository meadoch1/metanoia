defmodule Metanoia.Repo.Migrations.CreateFacility do
  use Ecto.Migration

  def change do
    create table(:facilities) do
      add :name, :string
      add :courier, :string
      add :avg_daily_pop, :integer
      add :address_id, references(:addresses)
      add :warden_id, references(:persons)
      add :chaplain_id, references(:persons)
      add :jurisdiction_id, references(:jurisdictions)
      add :security_level_id, references(:security_levels)
      add :pop_gender_id, references(:genders)

      timestamps
    end
    create index(:facilities, [:address_id])
    create index(:facilities, [:warden_id])
    create index(:facilities, [:chaplain_id])
    create index(:facilities, [:jurisdiction_id])
    create index(:facilities, [:security_level_id])
    create index(:facilities, [:pop_gender_id])

  end
end
