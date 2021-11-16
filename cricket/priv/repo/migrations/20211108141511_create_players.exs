defmodule Cricket.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :age, :integer
      add :country, :string
      add :hand, :string

      timestamps()
    end
  end
end
