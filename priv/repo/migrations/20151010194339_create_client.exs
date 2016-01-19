defmodule Metanoia.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :facility_ref_cd, :string
      add :earliest_out_dt, :date
      add :note, :string
      add :person_id, references(:persons)
      add :facility_id, references(:facilities)
      add :client_status_id, references(:client_status)

      timestamps
    end
    create index(:clients, [:person_id])
    create index(:clients, [:facility_id])
    create index(:clients, [:client_status_id])

  end
end
