defmodule Metanoia.Repo.Migrations.CreateLesson do
  use Ecto.Migration

  def change do
    create table(:lessons) do
      add :name, :string
      add :description, :string
      add :booklet, :boolean, default: false
      add :order_nr, :integer
      add :course_id, references(:courses)

      timestamps
    end
    create index(:lessons, [:course_id])

  end
end
