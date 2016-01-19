defmodule Metanoia.Repo.Migrations.CreateScheduleEntry do
  use Ecto.Migration

  def change do
    create table(:schedule_entries) do
      add :day_of_week, :integer
      add :week_of_month, :integer
      add :mentor_group_id, references(:mentor_groups)

      timestamps
    end
    create index(:schedule_entries, [:mentor_group_id])

  end
end
