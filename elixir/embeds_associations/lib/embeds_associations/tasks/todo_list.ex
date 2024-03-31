defmodule EmbedsAssociations.Tasks.TodoList do
  use Ecto.Schema
  import Ecto.Changeset

  has_many :todo_items, MyApp.Tasks.TodoItem

  schema "todo_lists" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo_list, params \\ %{}) do
    todo_list
    |> cast(params, [:body])
    |> cast_assoc(:todo_items, required: true)
  end
end
