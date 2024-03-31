defmodule EmbedsAssociationsWeb.TodoListControllerTest do
  use EmbedsAssociationsWeb.ConnCase

  import EmbedsAssociations.TasksFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  describe "index" do
    test "lists all todo_lists", %{conn: conn} do
      conn = get(conn, ~p"/todo_lists")
      assert html_response(conn, 200) =~ "Listing Todo lists"
    end
  end

  describe "new todo_list" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/todo_lists/new")
      assert html_response(conn, 200) =~ "New Todo list"
    end
  end

  describe "create todo_list" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/todo_lists", todo_list: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/todo_lists/#{id}"

      conn = get(conn, ~p"/todo_lists/#{id}")
      assert html_response(conn, 200) =~ "Todo list #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/todo_lists", todo_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Todo list"
    end
  end

  describe "edit todo_list" do
    setup [:create_todo_list]

    test "renders form for editing chosen todo_list", %{conn: conn, todo_list: todo_list} do
      conn = get(conn, ~p"/todo_lists/#{todo_list}/edit")
      assert html_response(conn, 200) =~ "Edit Todo list"
    end
  end

  describe "update todo_list" do
    setup [:create_todo_list]

    test "redirects when data is valid", %{conn: conn, todo_list: todo_list} do
      conn = put(conn, ~p"/todo_lists/#{todo_list}", todo_list: @update_attrs)
      assert redirected_to(conn) == ~p"/todo_lists/#{todo_list}"

      conn = get(conn, ~p"/todo_lists/#{todo_list}")
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, todo_list: todo_list} do
      conn = put(conn, ~p"/todo_lists/#{todo_list}", todo_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Todo list"
    end
  end

  describe "delete todo_list" do
    setup [:create_todo_list]

    test "deletes chosen todo_list", %{conn: conn, todo_list: todo_list} do
      conn = delete(conn, ~p"/todo_lists/#{todo_list}")
      assert redirected_to(conn) == ~p"/todo_lists"

      assert_error_sent 404, fn ->
        get(conn, ~p"/todo_lists/#{todo_list}")
      end
    end
  end

  defp create_todo_list(_) do
    todo_list = todo_list_fixture()
    %{todo_list: todo_list}
  end
end
