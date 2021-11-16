defmodule Cricket.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cricket.Teams` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Cricket.Teams.create_team()

    team
  end

  @doc """
  Generate a team_player.
  """
  def team_player_fixture(attrs \\ %{}) do
    {:ok, team_player} =
      attrs
      |> Enum.into(%{

      })
      |> Cricket.Teams.create_team_player()

    team_player
  end
end
