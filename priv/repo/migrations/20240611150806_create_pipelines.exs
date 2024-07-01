defmodule Imdb.Repo.Migrations.CreatePipelines do
  use Ecto.Migration

  def change do
    create table(:pipelines) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
