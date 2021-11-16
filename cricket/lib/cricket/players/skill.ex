defmodule Cricket.Players.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :batting, :integer
    field :bowling, :integer
    belongs_to :player, Cricket.Players.Player
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:batting, :bowling])
    |> validate_required([:batting, :bowling])
  end
end
