defmodule Pointer.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    has_many :articles, Pointer.Articles.Article

    timestamps()
  end
end
