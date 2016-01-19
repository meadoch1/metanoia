defmodule Metanoia.Repo.Migrations.AddPastorIdToPersons do
  use Ecto.Migration

  def change do
    alter table(:persons) do
      add :pastor_id, references(:pastors)
    end
    create index(:persons, [:pastor_id])
  end
end
