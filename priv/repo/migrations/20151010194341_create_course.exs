defmodule Metanoia.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :level, :string
      add :description, :string
      add :order_nr, :integer
      add :curriculum_id, references(:curriculums)

      timestamps
    end
    create index(:courses, [:curriculum_id])

  end
end
