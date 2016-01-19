defmodule Metanoia.Repo.Migrations.CreateDenomination do
  use Ecto.Migration

  def change do
    create table(:denominations) do
      add :name, :string

      timestamps
    end

  end
end
