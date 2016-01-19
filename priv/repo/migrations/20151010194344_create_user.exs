defmodule Metanoia.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :encrypted_password, :string
      add :admin, :boolean, default: false
      add :person_id, references(:persons)

      timestamps
    end
    create index(:users, [:person_id])

  end
end
