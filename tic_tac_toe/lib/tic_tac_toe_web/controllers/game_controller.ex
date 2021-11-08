defmodule TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  def new(conn, _) do
    game_id = UUID.uuid4()
    redirect(conn, to: Routes.game_path(conn, :show, game_id))
  end

  def show(conn, _) do
    render(conn, "show.html")
  end
end
