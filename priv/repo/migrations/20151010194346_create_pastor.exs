defmodule Metanoia.Repo.Migrations.CreatePastor do
  use Ecto.Migration

  def change do
    create table(:pastors) do
      add :is_primary, :boolean, default: false
      add :is_head, :boolean, default: false
      add :person_id, references(:persons)

      timestamps
    end
    create index(:pastors, [:person_id])

  end
end
