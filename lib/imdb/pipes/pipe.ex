defmodule Imdb.Pipes.Pipe do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "pipes" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pipe, attrs) do
    pipe
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
