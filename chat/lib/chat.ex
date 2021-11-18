defmodule Chat do
  import Ecto.Query, warn: false
  alias Chat.Repo
  alias Chat.Users.User

  @moduledoc """
  Chat keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_username_by_id!(user_id) do
    query =
      from user in User,
        select: user.username,
        where: user.id == ^user_id

    Repo.one!(query)
  end
end
