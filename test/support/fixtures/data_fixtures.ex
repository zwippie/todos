defmodule Todos.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todos.Data` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        title: "some title"
      })
      |> Todos.Data.create_todo()

    todo
  end
end
