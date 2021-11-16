defmodule CatalogExample.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CatalogExample.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        price: "120.5",
        title: "some title",
        views: 42
      })
      |> CatalogExample.Catalog.create_product()

    product
  end

  @doc """
  Generate a vendor.
  """
  def vendor_fixture(attrs \\ %{}) do
    {:ok, vendor} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name",
        phone: "120.5"
      })
      |> CatalogExample.Catalog.create_vendor()

    vendor
  end
end
