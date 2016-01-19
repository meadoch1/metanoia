defmodule Metanoia.Repo.Migrations.CreateClientCommunicationType do
  use Ecto.Migration

  def change do
    create table(:client_communication_types) do
      add :name, :string
      add :contents, :string

      timestamps
    end

  end
end
