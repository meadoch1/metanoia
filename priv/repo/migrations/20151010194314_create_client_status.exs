defmodule Metanoia.Repo.Migrations.CreateClientStatus do
  use Ecto.Migration

  def change do
    create table(:client_status) do
      add :name, :string

      timestamps
    end

  end
end
