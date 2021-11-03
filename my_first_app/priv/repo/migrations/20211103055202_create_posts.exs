defmodule MyFirstApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :author_id, :integer
      add :body, :string
      add :publish_date, :date

      timestamps()
    end
  end
end
