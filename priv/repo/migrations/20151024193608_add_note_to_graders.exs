defmodule Metanoia.Repo.Migrations.AddNoteToGraders do
  use Ecto.Migration

  def change do
    alter table(:volunteers) do
      add :note, :string
    end
  end
end
