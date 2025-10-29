defmodule Todos.DataTest do
  use Todos.DataCase

  alias Todos.Data

  describe "todos" do
    alias Todos.Data.Todo

    import Todos.DataFixtures

    @invalid_attrs %{title: nil, completed: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Data.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Data.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{title: "some title", completed: true}

      assert {:ok, %Todo{} = todo} = Data.create_todo(valid_attrs)
      assert todo.title == "some title"
      assert todo.completed == true
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{title: "some updated title", completed: false}

      assert {:ok, %Todo{} = todo} = Data.update_todo(todo, update_attrs)
      assert todo.title == "some updated title"
      assert todo.completed == false
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_todo(todo, @invalid_attrs)
      assert todo == Data.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Data.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Data.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Data.change_todo(todo)
    end
  end
end
