defmodule Imdb.Repo.Migrations.CreatePipes do
  use Ecto.Migration

  def change do
    create table(:pipes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
