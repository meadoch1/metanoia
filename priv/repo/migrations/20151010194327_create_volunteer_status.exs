defmodule Metanoia.Repo.Migrations.CreateVolunteerStatus do
  use Ecto.Migration

  def change do
    create table(:volunteer_status) do
      add :name, :string

      timestamps
    end

  end
end
