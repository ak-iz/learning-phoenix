defmodule ChatWeb.ChatController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", user: Pow.Plug.current_user(conn))
  end
end
