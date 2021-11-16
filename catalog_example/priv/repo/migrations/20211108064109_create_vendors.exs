defmodule CatalogExample.Repo.Migrations.CreateVendors do
  use Ecto.Migration

  def change do
    create table(:vendors) do
      add :name, :string
      add :address, :string
      add :phone, :decimal

      timestamps()
    end
  end
end
