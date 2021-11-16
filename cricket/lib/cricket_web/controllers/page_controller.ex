defmodule CricketWeb.PageController do
  use CricketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
