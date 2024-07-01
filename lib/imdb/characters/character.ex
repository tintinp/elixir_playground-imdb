defmodule Imdb.Characters.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    belongs_to :movie, Imdb.Movies.Movie

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(character, attrs) do
    IO.puts("CHANGESET")

    character =
      character
      |> cast(attrs, [:name, :movie_id])
      |> validate_required([:name])

    IO.puts("CHANGESET DONE")
    character
  end
end
