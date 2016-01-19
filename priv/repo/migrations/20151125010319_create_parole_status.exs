defmodule Metanoia.Repo.Migrations.CreateParoleStatus do
  use Ecto.Migration

  def change do
    create table(:parole_status) do
      add :name, :string

      timestamps
    end

  end
end
