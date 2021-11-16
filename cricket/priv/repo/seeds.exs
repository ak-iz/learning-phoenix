# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cricket.Repo.insert!(%Cricket.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

types = [
  "Opening Batsman",
  "Batsman",
  "Wicket Keeper",
  "All Rounder",
  "Pace Bowler",
  "Spin Bowler"
]

for type <- types do
  {:ok, _} = Cricket.Players.create_classification(%{type: type})
end
