defmodule Cricket.Guardian.AuthPipeline do
  @claims %{type: "access"}

  use Guardian.Plug.Pipeline,
    otp_app: :cricket,
    module: Cricket.Guardian,
    error_handler: Cricket.Guardian.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: @claims, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
end
