defmodule ImdbWeb.PipeController do
  use ImdbWeb, :controller

  alias Imdb.Pipes
  alias Imdb.Pipes.Pipe

  action_fallback ImdbWeb.FallbackController

  def index(conn, _params) do
    pipes = Pipes.list_pipes()
    render(conn, :index, pipes: pipes)
  end

  def create(conn, %{"pipe" => pipe_params}) do
    with {:ok, %Pipe{} = pipe} <- Pipes.create_pipe(pipe_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pipes/#{pipe}")
      |> render(:show, pipe: pipe)
    end
  end

  def show(conn, %{"id" => id}) do
    pipe = Pipes.get_pipe!(id)
    render(conn, :show, pipe: pipe)
  end

  def update(conn, %{"id" => id, "pipe" => pipe_params}) do
    pipe = Pipes.get_pipe!(id)

    with {:ok, %Pipe{} = pipe} <- Pipes.update_pipe(pipe, pipe_params) do
      render(conn, :show, pipe: pipe)
    end
  end

  def delete(conn, %{"id" => id}) do
    pipe = Pipes.get_pipe!(id)

    with {:ok, %Pipe{}} <- Pipes.delete_pipe(pipe) do
      send_resp(conn, :no_content, "")
    end
  end
end
