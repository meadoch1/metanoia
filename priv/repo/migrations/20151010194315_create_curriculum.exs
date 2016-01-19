defmodule Metanoia.Repo.Migrations.CreateCurriculum do
  use Ecto.Migration

  def change do
    create table(:curriculums) do
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
