defmodule Metanoia.Repo.Migrations.CreateVolunteer do
  use Ecto.Migration

  def change do
    create table(:volunteers) do
      add :mna_second_career, :boolean, default: false
      add :person_id, references(:persons)
      add :volunteer_status_id, references(:volunteer_status)
      add :relationship_preference_id, references(:relationship_preferences)

      timestamps
    end
    create index(:volunteers, [:person_id])
    create index(:volunteers, [:volunteer_status_id])
    create index(:volunteers, [:relationship_preference_id])

  end
end
