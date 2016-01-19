defmodule Metanoia.Repo.Migrations.CreatePresbytery do
  use Ecto.Migration

  def change do
    create table(:presbyteries) do
      add :name, :string

      timestamps
    end

  end
end
