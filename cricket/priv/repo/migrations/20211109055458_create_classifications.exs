defmodule Cricket.Repo.Migrations.CreateClassifications do
  use Ecto.Migration

  def change do
    create table(:classifications) do
      add :type, :string

      timestamps()
    end

    create unique_index(:classifications, [:type])
  end
end
