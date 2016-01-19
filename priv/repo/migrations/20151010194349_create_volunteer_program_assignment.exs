defmodule Metanoia.Repo.Migrations.CreateVolunteerProgramAssignment do
  use Ecto.Migration

  def change do
    create table(:volunteer_program_assignments) do
      add :volunteer_id, references(:volunteers)
      add :program_id, references(:programs)

      timestamps
    end
    create index(:volunteer_program_assignments, [:volunteer_id])
    create index(:volunteer_program_assignments, [:program_id])

  end
end
