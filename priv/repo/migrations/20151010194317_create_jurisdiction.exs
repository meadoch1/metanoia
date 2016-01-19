defmodule Metanoia.Repo.Migrations.CreateJurisdiction do
  use Ecto.Migration

  def change do
    create table(:jurisdictions) do
      add :name, :string

      timestamps
    end

  end
end
