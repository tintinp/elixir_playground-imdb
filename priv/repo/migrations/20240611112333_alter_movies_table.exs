defmodule Imdb.Repo.Migrations.AlterMoviesTable do
  use Ecto.Migration

  def change do
    alter table("movies") do
      add_if_not_exists :rating, :float
    end
  end
end
