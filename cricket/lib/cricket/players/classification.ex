defmodule Cricket.Players.Classification do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:type]}

  schema "classifications" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(classification, attrs) do
    classification
    |> cast(attrs, [:type])
    |> validate_required([:type])
    |> unique_constraint(:type)
  end
end
