defmodule Cricket.PlayersTest do
  use Cricket.DataCase

  alias Cricket.Players

  describe "players" do
    alias Cricket.Players.Player

    import Cricket.PlayersFixtures

    @invalid_attrs %{age: nil, country: nil, hand: nil, name: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Players.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Players.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{age: 42, country: "some country", hand: "some hand", name: "some name"}

      assert {:ok, %Player{} = player} = Players.create_player(valid_attrs)
      assert player.age == 42
      assert player.country == "some country"
      assert player.hand == "some hand"
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{age: 43, country: "some updated country", hand: "some updated hand", name: "some updated name"}

      assert {:ok, %Player{} = player} = Players.update_player(player, update_attrs)
      assert player.age == 43
      assert player.country == "some updated country"
      assert player.hand == "some updated hand"
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_player(player, @invalid_attrs)
      assert player == Players.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Players.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Players.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Players.change_player(player)
    end
  end

  describe "classifications" do
    alias Cricket.Players.Classification

    import Cricket.PlayersFixtures

    @invalid_attrs %{type: nil}

    test "list_classifications/0 returns all classifications" do
      classification = classification_fixture()
      assert Players.list_classifications() == [classification]
    end

    test "get_classification!/1 returns the classification with given id" do
      classification = classification_fixture()
      assert Players.get_classification!(classification.id) == classification
    end

    test "create_classification/1 with valid data creates a classification" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %Classification{} = classification} = Players.create_classification(valid_attrs)
      assert classification.type == "some type"
    end

    test "create_classification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_classification(@invalid_attrs)
    end

    test "update_classification/2 with valid data updates the classification" do
      classification = classification_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %Classification{} = classification} = Players.update_classification(classification, update_attrs)
      assert classification.type == "some updated type"
    end

    test "update_classification/2 with invalid data returns error changeset" do
      classification = classification_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_classification(classification, @invalid_attrs)
      assert classification == Players.get_classification!(classification.id)
    end

    test "delete_classification/1 deletes the classification" do
      classification = classification_fixture()
      assert {:ok, %Classification{}} = Players.delete_classification(classification)
      assert_raise Ecto.NoResultsError, fn -> Players.get_classification!(classification.id) end
    end

    test "change_classification/1 returns a classification changeset" do
      classification = classification_fixture()
      assert %Ecto.Changeset{} = Players.change_classification(classification)
    end
  end

  describe "skills" do
    alias Cricket.Players.Skill

    import Cricket.PlayersFixtures

    @invalid_attrs %{batting: nil, bowling: nil}

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Players.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Players.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      valid_attrs = %{batting: "120.5", bowling: "120.5"}

      assert {:ok, %Skill{} = skill} = Players.create_skill(valid_attrs)
      assert skill.batting == Decimal.new("120.5")
      assert skill.bowling == Decimal.new("120.5")
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      update_attrs = %{batting: "456.7", bowling: "456.7"}

      assert {:ok, %Skill{} = skill} = Players.update_skill(skill, update_attrs)
      assert skill.batting == Decimal.new("456.7")
      assert skill.bowling == Decimal.new("456.7")
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_skill(skill, @invalid_attrs)
      assert skill == Players.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Players.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Players.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Players.change_skill(skill)
    end
  end
end
