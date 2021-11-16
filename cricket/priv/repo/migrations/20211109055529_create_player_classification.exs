defmodule Cricket.Repo.Migrations.CreatePlayerClassification do
  use Ecto.Migration

  def change do
    create table(:player_classification, primary_key: false) do
      add :player_id, references(:players, on_delete: :delete_all)
      add :classification_id, references(:classifications, on_delete: :delete_all)
    end
    create index(:player_classification, [:player_id])
    create index(:player_classification, [:classification_id])
    create unique_index(:player_classification, [:player_id, :classification_id])
  end
end
