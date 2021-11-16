defmodule CricketWeb.TeamView do
  use CricketWeb, :view

  def player_select(f, changeset, :opener), do: select_box(f, changeset, 1)
  def player_select(f, changeset, :batsman), do: select_box(f, changeset, 2)
  def player_select(f, changeset, :keeper), do: select_box(f, changeset, 3)
  def player_select(f, changeset, :allrounder), do: select_box(f, changeset, 4)
  def player_select(f, changeset, :pace), do: select_box(f, changeset, 5)
  def player_select(f, changeset, :spin), do: select_box(f, changeset, 6)

  defp select_box(f, changeset, type) do
    existing_ids =
      changeset |> Ecto.Changeset.get_change(:team_players, []) |> Enum.map(& &1.data.id)

    select_opts =
      for t <- Cricket.Players.list_players_by_type(type) do
        [key: t.name, value: t.id, selected: t.id in existing_ids]
      end

    multiple_select(f, :players_id, select_opts)
  end
end
