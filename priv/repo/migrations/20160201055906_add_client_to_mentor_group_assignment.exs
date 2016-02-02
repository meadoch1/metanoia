defmodule Metanoia.Repo.Migrations.AddClientToMentorGroupAssignment do
  use Ecto.Migration

  def change do
    alter table(:mentor_group_assignments) do
      add :client_id, references(:clients)
      add :program_id, references(:programs)
    end
  end
end
