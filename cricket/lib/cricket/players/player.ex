defmodule Cricket.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :age, :integer
    field :country, :string
    field :hand, :string
    field :name, :string

    # has_one :type, {"player_classification", Cricket.Players.Classification}
    # has_one :type, Cricket.Players.Classification, foreign_key: :type, references: :id
    # has_one :player_type, through: [:type, :classification]
    many_to_many :type, Cricket.Players.Classification,
      join_through: "player_classification",
      on_replace: :delete

    has_one :skills, Cricket.Players.Skill, on_replace: :delete
    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :age, :country, :hand])
    |> validate_required([:name, :age, :country, :hand])
  end
end
