defmodule Imdb.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :rating, :float

      timestamps(type: :utc_datetime)
    end
  end
end
