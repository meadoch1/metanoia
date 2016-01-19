defmodule Metanoia.Repo.Migrations.CreateSecurityLevel do
  use Ecto.Migration

  def change do
    create table(:security_levels) do
      add :name, :string

      timestamps
    end

  end
end
