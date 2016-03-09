defmodule Metanoia.Repo.Migrations.CreateMentorGroupReport do
  use Ecto.Migration

  def change do
    create table(:mentor_group_reports) do
      add :meeting_dt, :date
      add :note, :string
      add :mentor_group_id, references(:mentor_groups, on_delete: :nothing)

      timestamps
    end
    create index(:mentor_group_reports, [:mentor_group_id])

  end
end
