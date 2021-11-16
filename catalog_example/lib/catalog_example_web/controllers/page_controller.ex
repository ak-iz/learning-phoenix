defmodule CatalogExampleWeb.PageController do
  use CatalogExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
