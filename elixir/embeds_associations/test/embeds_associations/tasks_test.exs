defmodule EmbedsAssociations.TasksTest do
  use EmbedsAssociations.DataCase

  alias EmbedsAssociations.Tasks

  describe "todo_lists" do
    alias EmbedsAssociations.Tasks.TodoList

    import EmbedsAssociations.TasksFixtures

    @invalid_attrs %{title: nil}

    test "list_todo_lists/0 returns all todo_lists" do
      todo_list = todo_list_fixture()
      assert Tasks.list_todo_lists() == [todo_list]
    end

    test "get_todo_list!/1 returns the todo_list with given id" do
      todo_list = todo_list_fixture()
      assert Tasks.get_todo_list!(todo_list.id) == todo_list
    end

    test "create_todo_list/1 with valid data creates a todo_list" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %TodoList{} = todo_list} = Tasks.create_todo_list(valid_attrs)
      assert todo_list.title == "some title"
    end

    test "create_todo_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_todo_list(@invalid_attrs)
    end

    test "update_todo_list/2 with valid data updates the todo_list" do
      todo_list = todo_list_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %TodoList{} = todo_list} = Tasks.update_todo_list(todo_list, update_attrs)
      assert todo_list.title == "some updated title"
    end

    test "update_todo_list/2 with invalid data returns error changeset" do
      todo_list = todo_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_todo_list(todo_list, @invalid_attrs)
      assert todo_list == Tasks.get_todo_list!(todo_list.id)
    end

    test "delete_todo_list/1 deletes the todo_list" do
      todo_list = todo_list_fixture()
      assert {:ok, %TodoList{}} = Tasks.delete_todo_list(todo_list)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_todo_list!(todo_list.id) end
    end

    test "change_todo_list/1 returns a todo_list changeset" do
      todo_list = todo_list_fixture()
      assert %Ecto.Changeset{} = Tasks.change_todo_list(todo_list)
    end
  end
end
