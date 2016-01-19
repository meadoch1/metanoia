defmodule Metanoia.Repo.Migrations.CreateStudentLesson do
  use Ecto.Migration

  def change do
    create table(:student_lessons) do
      add :sent_dt, :date
      add :received_dt, :date
      add :grade, :float
      add :student_id, references(:clients)
      add :lesson_id, references(:lessons)

      timestamps
    end
    create index(:student_lessons, [:student_id])
    create index(:student_lessons, [:lesson_id])

  end
end
