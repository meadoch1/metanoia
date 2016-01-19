defmodule Metanoia.Repo.Migrations.CreateClientCommunication do
  use Ecto.Migration

  def change do
    create table(:client_communications) do
      add :sent_dt, :date
      add :note, :string
      add :client_id, references(:clients)
      add :client_communication_type_id, references(:client_communication_types)

      timestamps
    end
    create index(:client_communications, [:client_id])
    create index(:client_communications, [:client_communication_type_id])

  end
end
