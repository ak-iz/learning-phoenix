defmodule CatalogExample.CatalogTest do
  use CatalogExample.DataCase

  alias CatalogExample.Catalog

  describe "products" do
    alias CatalogExample.Catalog.Product

    import CatalogExample.CatalogFixtures

    @invalid_attrs %{description: nil, price: nil, title: nil, views: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{description: "some description", price: "120.5", title: "some title", views: 42}

      assert {:ok, %Product{} = product} = Catalog.create_product(valid_attrs)
      assert product.description == "some description"
      assert product.price == Decimal.new("120.5")
      assert product.title == "some title"
      assert product.views == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{description: "some updated description", price: "456.7", title: "some updated title", views: 43}

      assert {:ok, %Product{} = product} = Catalog.update_product(product, update_attrs)
      assert product.description == "some updated description"
      assert product.price == Decimal.new("456.7")
      assert product.title == "some updated title"
      assert product.views == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end

  describe "vendors" do
    alias CatalogExample.Catalog.Vendor

    import CatalogExample.CatalogFixtures

    @invalid_attrs %{address: nil, name: nil, phone: nil}

    test "list_vendors/0 returns all vendors" do
      vendor = vendor_fixture()
      assert Catalog.list_vendors() == [vendor]
    end

    test "get_vendor!/1 returns the vendor with given id" do
      vendor = vendor_fixture()
      assert Catalog.get_vendor!(vendor.id) == vendor
    end

    test "create_vendor/1 with valid data creates a vendor" do
      valid_attrs = %{address: "some address", name: "some name", phone: "120.5"}

      assert {:ok, %Vendor{} = vendor} = Catalog.create_vendor(valid_attrs)
      assert vendor.address == "some address"
      assert vendor.name == "some name"
      assert vendor.phone == Decimal.new("120.5")
    end

    test "create_vendor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_vendor(@invalid_attrs)
    end

    test "update_vendor/2 with valid data updates the vendor" do
      vendor = vendor_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name", phone: "456.7"}

      assert {:ok, %Vendor{} = vendor} = Catalog.update_vendor(vendor, update_attrs)
      assert vendor.address == "some updated address"
      assert vendor.name == "some updated name"
      assert vendor.phone == Decimal.new("456.7")
    end

    test "update_vendor/2 with invalid data returns error changeset" do
      vendor = vendor_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_vendor(vendor, @invalid_attrs)
      assert vendor == Catalog.get_vendor!(vendor.id)
    end

    test "delete_vendor/1 deletes the vendor" do
      vendor = vendor_fixture()
      assert {:ok, %Vendor{}} = Catalog.delete_vendor(vendor)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_vendor!(vendor.id) end
    end

    test "change_vendor/1 returns a vendor changeset" do
      vendor = vendor_fixture()
      assert %Ecto.Changeset{} = Catalog.change_vendor(vendor)
    end
  end
end
