defmodule Imdb.Pipelines.Pipeline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pipelines" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pipeline, attrs) do
    pipeline
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
