defmodule Imdb.PipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Imdb.Pipes` context.
  """

  @doc """
  Generate a pipe.
  """
  def pipe_fixture(attrs \\ %{}) do
    {:ok, pipe} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Imdb.Pipes.create_pipe()

    pipe
  end
end
