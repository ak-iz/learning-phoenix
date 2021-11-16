defmodule Cricket.PlayersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cricket.Players` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        age: 42,
        country: "some country",
        hand: "some hand",
        name: "some name"
      })
      |> Cricket.Players.create_player()

    player
  end

  @doc """
  Generate a unique classification type.
  """
  def unique_classification_type, do: "some type#{System.unique_integer([:positive])}"

  @doc """
  Generate a classification.
  """
  def classification_fixture(attrs \\ %{}) do
    {:ok, classification} =
      attrs
      |> Enum.into(%{
        type: unique_classification_type()
      })
      |> Cricket.Players.create_classification()

    classification
  end

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        batting: "120.5",
        bowling: "120.5"
      })
      |> Cricket.Players.create_skill()

    skill
  end
end
