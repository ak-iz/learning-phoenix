defmodule MyFirstApp.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :author_id, :integer
    field :body, :string
    field :name, :string
    field :publish_date, :date

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :author_id, :body, :publish_date])
    |> validate_required([:name, :author_id, :body, :publish_date])
  end
end
