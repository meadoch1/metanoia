defmodule Metanoia.Repo.Migrations.CreateMentorGroupAssignment do
  use Ecto.Migration

  def change do
    create table(:mentor_group_assignments) do
      add :mentor_group_id, references(:mentor_groups)
      add :volunteer_id, references(:volunteers)

      timestamps
    end
    create index(:mentor_group_assignments, [:mentor_group_id])
    create index(:mentor_group_assignments, [:volunteer_id])

  end
end
