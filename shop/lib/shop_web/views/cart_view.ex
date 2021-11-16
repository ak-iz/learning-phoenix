defmodule ShopWeb.CartView do
  use ShopWeb, :view

  alias Shop.ShoppingCart

  def currency_to_str(%Decimal{} = val), do: "$#{Decimal.round(val, 2)}"
end
