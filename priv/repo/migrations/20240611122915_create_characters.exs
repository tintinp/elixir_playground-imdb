defmodule Imdb.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :movie_id, references(:movies)

      timestamps(type: :utc_datetime)
    end
  end
end
