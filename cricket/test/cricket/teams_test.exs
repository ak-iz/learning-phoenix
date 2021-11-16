defmodule Cricket.TeamsTest do
  use Cricket.DataCase

  alias Cricket.Teams

  describe "teams" do
    alias Cricket.Teams.Team

    import Cricket.TeamsFixtures

    @invalid_attrs %{name: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Team{} = team} = Teams.create_team(valid_attrs)
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Team{} = team} = Teams.update_team(team, update_attrs)
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end

  describe "team_players" do
    alias Cricket.Teams.TeamPlayer

    import Cricket.TeamsFixtures

    @invalid_attrs %{}

    test "list_team_players/0 returns all team_players" do
      team_player = team_player_fixture()
      assert Teams.list_team_players() == [team_player]
    end

    test "get_team_player!/1 returns the team_player with given id" do
      team_player = team_player_fixture()
      assert Teams.get_team_player!(team_player.id) == team_player
    end

    test "create_team_player/1 with valid data creates a team_player" do
      valid_attrs = %{}

      assert {:ok, %TeamPlayer{} = team_player} = Teams.create_team_player(valid_attrs)
    end

    test "create_team_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team_player(@invalid_attrs)
    end

    test "update_team_player/2 with valid data updates the team_player" do
      team_player = team_player_fixture()
      update_attrs = %{}

      assert {:ok, %TeamPlayer{} = team_player} = Teams.update_team_player(team_player, update_attrs)
    end

    test "update_team_player/2 with invalid data returns error changeset" do
      team_player = team_player_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team_player(team_player, @invalid_attrs)
      assert team_player == Teams.get_team_player!(team_player.id)
    end

    test "delete_team_player/1 deletes the team_player" do
      team_player = team_player_fixture()
      assert {:ok, %TeamPlayer{}} = Teams.delete_team_player(team_player)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team_player!(team_player.id) end
    end

    test "change_team_player/1 returns a team_player changeset" do
      team_player = team_player_fixture()
      assert %Ecto.Changeset{} = Teams.change_team_player(team_player)
    end
  end
end
