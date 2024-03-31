defmodule EmbedsAssociationsWeb.TodoListHTML do
  use EmbedsAssociationsWeb, :html

  embed_templates "todo_list_html/*"

  @doc """
  Renders a todo_list form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def todo_list_form(assigns)
end
