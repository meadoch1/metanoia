defmodule Metanoia.Repo.Migrations.AddFieldsToPersons do
  use Ecto.Migration

  def change do
    alter table(:persons) do
      add :work_phone, :string
      add :spouse_name, :string
      add :email2, :string
    end
  end
end
