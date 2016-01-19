defmodule Metanoia.Repo.Migrations.CreateClientVolunteerAssignment do
  use Ecto.Migration

  def change do
    create table(:client_volunteer_assignments) do
      add :client_id, references(:clients)
      add :program_id, references(:programs)
      add :volunteer_id, references(:volunteers)

      timestamps
    end
    create index(:client_volunteer_assignments, [:client_id])
    create index(:client_volunteer_assignments, [:program_id])
    create index(:client_volunteer_assignments, [:volunteer_id])

  end
end
