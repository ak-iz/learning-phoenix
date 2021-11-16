defmodule TicTacToe.Game.Supervisor do
  use DynamicSupervisor

  def start_link(init_arg) do
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def start_child(id) do
    # If MyWorker is not using the new child specs, we need to pass a map:
    # spec = %{id: MyWorker, start: {MyWorker, :start_link, [foo, bar, baz]}}
    spec = {TicTacToe.Game, id: id}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  @impl true
  def init(init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one, extra_arguments: [init_arg])
  end

  def new_game(id) do
    IO.inspect(id)
    start_child(id: id)
  end

  def find_game(id) do
    {:via, Registry, {TicTacToe.Game.Registry, id}}
  end
end
