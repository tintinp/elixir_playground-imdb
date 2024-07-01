defmodule ImdbWeb.PipelineJSON do
  alias Imdb.Pipelines.Pipeline

  @doc """
  Renders a list of pipelines.
  """
  def index(%{pipelines: pipelines}) do
    %{data: for(pipeline <- pipelines, do: data(pipeline))}
  end

  @doc """
  Renders a single pipeline.
  """
  def show(%{pipeline: pipeline}) do
    %{data: data(pipeline)}
  end

  defp data(%Pipeline{} = pipeline) do
    %{
      id: pipeline.id,
      name: pipeline.name
    }
  end
end
