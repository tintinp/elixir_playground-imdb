defmodule ImdbWeb.PipeJSON do
  alias Imdb.Pipes.Pipe

  @doc """
  Renders a list of pipes.
  """
  def index(%{pipes: pipes}) do
    %{data: for(pipe <- pipes, do: data(pipe))}
  end

  @doc """
  Renders a single pipe.
  """
  def show(%{pipe: pipe}) do
    %{data: data(pipe)}
  end

  defp data(%Pipe{} = pipe) do
    %{
      id: pipe.id,
      name: pipe.name
    }
  end
end
