defmodule Cricket.Repo.Migrations.CreateTeamPlayers do
  use Ecto.Migration

  def change do
    create table(:team_players) do
      add :team_id, references(:teams, on_delete: :delete_all)
      add :player_id, references(:players, on_delete: :delete_all)
    end

    create index(:team_players, [:team_id])
    create index(:team_players, [:player_id])
    create unique_index(:team_players, [:team_id, :player_id])
  end
end
