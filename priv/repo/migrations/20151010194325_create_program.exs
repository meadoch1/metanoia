defmodule Metanoia.Repo.Migrations.CreateProgram do
  use Ecto.Migration

  def change do
    create table(:programs) do
      add :name, :string

      timestamps
    end

  end
end
