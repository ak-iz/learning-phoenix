defmodule Cricket.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :player_id, references(:players, on_delete: :delete_all)
      add :batting, :integer
      add :bowling, :integer
    end
  end
end
