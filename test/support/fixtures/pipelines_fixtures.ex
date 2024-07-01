defmodule Imdb.PipelinesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Imdb.Pipelines` context.
  """

  @doc """
  Generate a pipeline.
  """
  def pipeline_fixture(attrs \\ %{}) do
    {:ok, pipeline} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Imdb.Pipelines.create_pipeline()

    pipeline
  end
end
