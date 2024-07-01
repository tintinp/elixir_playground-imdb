defmodule Imdb.Pipes do
  @moduledoc """
  The Pipes context.
  """

  import Ecto.Query, warn: false
  alias Imdb.Repo

  alias Imdb.Pipes.Pipe

  @doc """
  Returns the list of pipes.

  ## Examples

      iex> list_pipes()
      [%Pipe{}, ...]

  """
  def list_pipes do
    Repo.all(Pipe)
  end

  @doc """
  Gets a single pipe.

  Raises `Ecto.NoResultsError` if the Pipe does not exist.

  ## Examples

      iex> get_pipe!(123)
      %Pipe{}

      iex> get_pipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pipe!(id), do: Repo.get!(Pipe, id)

  @doc """
  Creates a pipe.

  ## Examples

      iex> create_pipe(%{field: value})
      {:ok, %Pipe{}}

      iex> create_pipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pipe(attrs \\ %{}) do
    %Pipe{}
    |> Pipe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pipe.

  ## Examples

      iex> update_pipe(pipe, %{field: new_value})
      {:ok, %Pipe{}}

      iex> update_pipe(pipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pipe(%Pipe{} = pipe, attrs) do
    pipe
    |> Pipe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pipe.

  ## Examples

      iex> delete_pipe(pipe)
      {:ok, %Pipe{}}

      iex> delete_pipe(pipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pipe(%Pipe{} = pipe) do
    Repo.delete(pipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pipe changes.

  ## Examples

      iex> change_pipe(pipe)
      %Ecto.Changeset{data: %Pipe{}}

  """
  def change_pipe(%Pipe{} = pipe, attrs \\ %{}) do
    Pipe.changeset(pipe, attrs)
  end
end
