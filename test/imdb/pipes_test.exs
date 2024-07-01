defmodule Imdb.PipesTest do
  use Imdb.DataCase

  alias Imdb.Pipes

  describe "pipes" do
    alias Imdb.Pipes.Pipe

    import Imdb.PipesFixtures

    @invalid_attrs %{name: nil}

    test "list_pipes/0 returns all pipes" do
      pipe = pipe_fixture()
      assert Pipes.list_pipes() == [pipe]
    end

    test "get_pipe!/1 returns the pipe with given id" do
      pipe = pipe_fixture()
      assert Pipes.get_pipe!(pipe.id) == pipe
    end

    test "create_pipe/1 with valid data creates a pipe" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Pipe{} = pipe} = Pipes.create_pipe(valid_attrs)
      assert pipe.name == "some name"
    end

    test "create_pipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pipes.create_pipe(@invalid_attrs)
    end

    test "update_pipe/2 with valid data updates the pipe" do
      pipe = pipe_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Pipe{} = pipe} = Pipes.update_pipe(pipe, update_attrs)
      assert pipe.name == "some updated name"
    end

    test "update_pipe/2 with invalid data returns error changeset" do
      pipe = pipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Pipes.update_pipe(pipe, @invalid_attrs)
      assert pipe == Pipes.get_pipe!(pipe.id)
    end

    test "delete_pipe/1 deletes the pipe" do
      pipe = pipe_fixture()
      assert {:ok, %Pipe{}} = Pipes.delete_pipe(pipe)
      assert_raise Ecto.NoResultsError, fn -> Pipes.get_pipe!(pipe.id) end
    end

    test "change_pipe/1 returns a pipe changeset" do
      pipe = pipe_fixture()
      assert %Ecto.Changeset{} = Pipes.change_pipe(pipe)
    end
  end
end
