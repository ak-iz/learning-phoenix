defmodule MyFirstApp.Repo do
  use Ecto.Repo,
    otp_app: :my_first_app,
    adapter: Ecto.Adapters.Postgres
end
