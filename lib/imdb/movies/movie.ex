defmodule Imdb.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "movies" do
    field :title, :string
    field :rating, :float
    has_many :characters, Imdb.Characters.Character

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:id, :title, :rating])
    |> validate_required([:title])
  end
end
