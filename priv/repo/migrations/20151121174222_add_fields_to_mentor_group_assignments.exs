defmodule Metanoia.Repo.Migrations.AddFieldsToMentorGroup do
  use Ecto.Migration

  def change do
    alter table(:mentor_group_assignments) do
      add :comments, :string
      add :start_month, :date
    end
  end
end
