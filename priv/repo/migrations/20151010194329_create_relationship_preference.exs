defmodule Metanoia.Repo.Migrations.CreateRelationshipPreference do
  use Ecto.Migration

  def change do
    create table(:relationship_preferences) do
      add :name, :string

      timestamps
    end

  end
end
