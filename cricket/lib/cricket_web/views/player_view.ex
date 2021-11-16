defmodule CricketWeb.PlayerView do
  use CricketWeb, :view

  @countries [
    Afghanistan: "afghanistan",
    Australia: "australia",
    Bangladesh: "bangladesh",
    England: "england",
    India: "india",
    Ireland: "ireland",
    "New Zealand": "newzealand",
    Pakistan: "pakistan",
    "South Africa": "southafrica",
    "Sri Lanka": "srilanka",
    "West Indies": "westindies",
    Zimbabwe: "zimbabwe"
  ]
  def list_countries do
    @countries
  end

  def skills_field(f, changeset, type),
    do: number_input(f, type, min: 0, max: 10, value: skills_map_value(changeset, type))

  defp skills_map_value(changeset, type) do
    if changeset.data.skills do
      case Map.fetch(changeset.data.skills, type) do
        {:ok, val} -> val
        :error -> 0
      end
    else
      0
    end
  end

  def type_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:type, []) |> Enum.map(& &1.data.id)
    IO.inspect(existing_ids)

    select_opts =
      for t <- Cricket.Players.list_classifications() do
        # [key: t.type, value: t.id]
        [key: t.type, value: t.id, selected: t.id in existing_ids]
      end

    IO.inspect(select_opts)
    select(f, :type_id, select_opts)
  end

  def render("index.json", %{players: players}) do
    %{
      data:
        Enum.map(players, fn player ->
          %{name: player.name, age: player.age, country: player.country, type: player.type}
        end)
    }
  end
end
