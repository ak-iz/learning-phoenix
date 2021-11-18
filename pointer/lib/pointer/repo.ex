defmodule Pointer.Repo do
  use Ecto.Repo,
    otp_app: :pointer,
    adapter: Ecto.Adapters.Postgres
end
