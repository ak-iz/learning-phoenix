defmodule CatalogExample.Repo do
  use Ecto.Repo,
    otp_app: :catalog_example,
    adapter: Ecto.Adapters.Postgres
end
