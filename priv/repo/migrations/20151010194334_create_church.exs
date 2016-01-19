defmodule Metanoia.Repo.Migrations.CreateChurch do
  use Ecto.Migration

  def change do
    create table(:churches) do
      add :name, :string
      add :phone, :string
      add :one_time_support, :boolean, default: false
      add :ongoing_support, :boolean, default: false
      add :prayer_support, :boolean, default: false
      add :newsletter, :boolean, default: false
      add :address_id, references(:addresses)
      add :denomination_id, references(:denominations)
      add :presbytery_id, references(:presbyteries)

      timestamps
    end
    create index(:churches, [:address_id])
    create index(:churches, [:denomination_id])
    create index(:churches, [:presbytery_id])

  end
end
