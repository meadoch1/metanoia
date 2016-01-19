defmodule Metanoia.Repo.Migrations.AddExtraNameFieldsToPersons do
  use Ecto.Migration

  def change do
    alter table(:persons) do
      add :nickname, :string
      add :suffix, :string
    end
  end
end
