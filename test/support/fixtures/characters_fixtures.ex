defmodule Imdb.CharactersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Imdb.Characters` context.
  """

  @doc """
  Generate a character.
  """
  def character_fixture(attrs \\ %{}) do
    {:ok, character} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Imdb.Characters.create_character()

    character
  end
end
