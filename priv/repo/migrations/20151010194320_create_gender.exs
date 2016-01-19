defmodule Metanoia.Repo.Migrations.CreateGender do
  use Ecto.Migration

  def change do
    create table(:genders) do
      add :name, :string
      add :code, :string

      timestamps
    end

  end
end
