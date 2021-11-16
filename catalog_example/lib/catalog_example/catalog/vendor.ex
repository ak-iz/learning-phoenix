defmodule CatalogExample.Catalog.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendors" do
    field :address, :string
    field :name, :string
    field :phone, :decimal

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :address, :phone])
    |> validate_required([:name, :address, :phone])
  end
end
