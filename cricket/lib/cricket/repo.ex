defmodule Cricket.Repo do
  use Ecto.Repo,
    otp_app: :cricket,
    adapter: Ecto.Adapters.Postgres
end
