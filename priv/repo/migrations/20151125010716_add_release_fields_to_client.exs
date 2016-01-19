defmodule Metanoia.Repo.Migrations.AddReleaseFieldsToClient do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add :parole_status_id, references(:parole_status)
      add :tentative_parole_month, :date
      add :max_possible_release_dt, :date
      add :comment, :string
    end
    create index(:clients, [:parole_status_id])
  end
end
