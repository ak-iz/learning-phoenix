defmodule Cricket.Guardian do
  use Guardian, otp_app: :cricket
  alias Cricket.Accounts

  def subject_for_token(resource, _claims) do
    subject = to_string(resource.id)
    {:ok, subject}
  end

  def resource_from_claims(claims) do
    id = claims["subject"]
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end
end
