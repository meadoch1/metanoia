defmodule Metanoia.Repo.Migrations.AddAddressTextsToStudent do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add :facility_address_text, :string
      add :grader_address_text, :string
    end
  end
end
