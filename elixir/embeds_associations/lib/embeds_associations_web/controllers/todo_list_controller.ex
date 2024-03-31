defmodule EmbedsAssociationsWeb.TodoListController do
  use EmbedsAssociationsWeb, :controller

  alias EmbedsAssociations.Tasks
  alias EmbedsAssociations.Tasks.TodoList

  def index(conn, _params) do
    todo_lists = Tasks.list_todo_lists()
    render(conn, :index, todo_lists: todo_lists)
  end

  def new(conn, _params) do
    changeset = Tasks.change_todo_list(%TodoList{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"todo_list" => todo_list_params}) do
    case Tasks.create_todo_list(todo_list_params) do
      {:ok, todo_list} ->
        conn
        |> put_flash(:info, "Todo list created successfully.")
        |> redirect(to: ~p"/todo_lists/#{todo_list}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_list = Tasks.get_todo_list!(id)
    render(conn, :show, todo_list: todo_list)
  end

  def edit(conn, %{"id" => id}) do
    todo_list = Tasks.get_todo_list!(id)
    changeset = Tasks.change_todo_list(todo_list)
    render(conn, :edit, todo_list: todo_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo_list" => todo_list_params}) do
    todo_list = Tasks.get_todo_list!(id)

    case Tasks.update_todo_list(todo_list, todo_list_params) do
      {:ok, todo_list} ->
        conn
        |> put_flash(:info, "Todo list updated successfully.")
        |> redirect(to: ~p"/todo_lists/#{todo_list}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, todo_list: todo_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_list = Tasks.get_todo_list!(id)
    {:ok, _todo_list} = Tasks.delete_todo_list(todo_list)

    conn
    |> put_flash(:info, "Todo list deleted successfully.")
    |> redirect(to: ~p"/todo_lists")
  end
end
