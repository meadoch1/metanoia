defmodule Metanoia.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :first_name, :string
      add :last_name, :string
      add :middle_name, :string
      add :phone, :string
      add :mobile_phone, :string
      add :email, :string
      add :dob, :date
      add :address_id, references(:addresses)
      add :church_id, references(:churches)

      timestamps
    end
    create index(:persons, [:address_id])
    create index(:persons, [:church_id])

  end
end
