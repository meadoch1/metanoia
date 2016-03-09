defmodule Metanoia.Repo.Migrations.CreateMentorGroupReportDetail do
  use Ecto.Migration

  def change do
    create table(:mentor_group_report_details) do
      add :status, :string
      add :note, :string
      add :mentor_group_report_id, references(:mentor_group_reports, on_delete: :nothing)
      add :mentor_group_assignment_id, references(:mentor_group_assignments, on_delete: :nothing)

      timestamps
    end
    create index(:mentor_group_report_details, [:mentor_group_report_id])
    create index(:mentor_group_report_details, [:mentor_group_assignment_id])

  end
end
