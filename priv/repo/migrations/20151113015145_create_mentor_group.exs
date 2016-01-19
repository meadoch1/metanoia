defmodule Metanoia.Repo.Migrations.CreateMentorGroup do
  use Ecto.Migration

  def change do
    create table(:mentor_groups) do
      add :name, :string
      add :leader_id, references(:volunteers)
      add :facility_id, references(:facilities)

      timestamps
    end
    create index(:mentor_groups, [:leader_id])
    create index(:mentor_groups, [:facility_id])

  end
end
