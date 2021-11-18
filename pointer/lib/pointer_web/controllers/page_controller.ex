defmodule PointerWeb.PageController do
  use PointerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
