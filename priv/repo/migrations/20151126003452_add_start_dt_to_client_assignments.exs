defmodule Metanoia.Repo.Migrations.AddStartDtToClientAssignments do
  use Ecto.Migration

  def change do
    alter table(:client_volunteer_assignments) do
      add :start_month, :date
    end
  end
end
