defmodule Cricket.Players do
  @moduledoc """
  The Players context.
  """

  import Ecto.Query, warn: false
  alias Cricket.Repo

  alias Cricket.Players.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player) |> Repo.preload(:type)
  end

  def list_players_by_type(type) do
    initial_query =
      from c in "player_classification",
        join: p in Player,
        on: c.player_id == p.id,
        select: p,
        where: c.classification_id == ^type

    initial_query |> Repo.all()
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id) do
    Player |> Repo.get(id) |> Repo.preload(:type) |> Repo.preload(:skills)
  end

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> change_player(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> change_player(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    type = list_types_by_id(sanitize_type(attrs))
    IO.inspect(attrs)
    skills = create_skills_map(attrs)
    IO.inspect(skills)

    player
    |> Repo.preload(:type)
    |> Repo.preload(:skills)
    |> Player.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:type, type)
    |> Ecto.Changeset.put_assoc(:skills, skills)
  end

  defp sanitize_type(attrs) do
    if is_binary(attrs["type_id"]) do
      [String.to_integer(attrs["type_id"])]
    else
      []
    end
  end

  defp create_skills_map(attrs) do
    if is_binary(attrs["batting"]) do
      %{
        batting: String.to_integer(attrs["batting"]),
        bowling: String.to_integer(attrs["bowling"])
      }
    else
      %{batting: 0, bowling: 0}
    end
  end

  def list_types_by_id(nil), do: []

  def list_types_by_id(type_id) do
    Repo.all(from type in Cricket.Players.Classification, where: type.id in ^type_id)
  end

  alias Cricket.Players.Classification

  @doc """
  Returns the list of classifications.

  ## Examples

      iex> list_classifications()
      [%Classification{}, ...]

  """
  def list_classifications do
    Repo.all(Classification)
  end

  @doc """
  Gets a single classification.

  Raises `Ecto.NoResultsError` if the Classification does not exist.

  ## Examples

      iex> get_classification!(123)
      %Classification{}

      iex> get_classification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_classification!(id), do: Repo.get!(Classification, id)

  @doc """
  Creates a classification.

  ## Examples

      iex> create_classification(%{field: value})
      {:ok, %Classification{}}

      iex> create_classification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_classification(attrs \\ %{}) do
    %Classification{}
    |> Classification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a classification.

  ## Examples

      iex> update_classification(classification, %{field: new_value})
      {:ok, %Classification{}}

      iex> update_classification(classification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_classification(%Classification{} = classification, attrs) do
    classification
    |> Classification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a classification.

  ## Examples

      iex> delete_classification(classification)
      {:ok, %Classification{}}

      iex> delete_classification(classification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_classification(%Classification{} = classification) do
    Repo.delete(classification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking classification changes.

  ## Examples

      iex> change_classification(classification)
      %Ecto.Changeset{data: %Classification{}}

  """
  def change_classification(%Classification{} = classification, attrs \\ %{}) do
    Classification.changeset(classification, attrs)
  end

  alias Cricket.Players.Skill

  @doc """
  Returns the list of skills.

  ## Examples

      iex> list_skills()
      [%Skill{}, ...]

  """
  def list_skills do
    Repo.all(Skill)
  end

  @doc """
  Gets a single skill.

  Raises `Ecto.NoResultsError` if the Skill does not exist.

  ## Examples

      iex> get_skill!(123)
      %Skill{}

      iex> get_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill!(id), do: Repo.get!(Skill, id)

  @doc """
  Creates a skill.

  ## Examples

      iex> create_skill(%{field: value})
      {:ok, %Skill{}}

      iex> create_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill.

  ## Examples

      iex> update_skill(skill, %{field: new_value})
      {:ok, %Skill{}}

      iex> update_skill(skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill.

  ## Examples

      iex> delete_skill(skill)
      {:ok, %Skill{}}

      iex> delete_skill(skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill changes.

  ## Examples

      iex> change_skill(skill)
      %Ecto.Changeset{data: %Skill{}}

  """
  def change_skill(%Skill{} = skill, attrs \\ %{}) do
    Skill.changeset(skill, attrs)
  end
end
