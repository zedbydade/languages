defmodule Chapter13 do
  @moduledoc """
  Documentation for `Chapter13`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chapter13.hello()
      :world

  """
  def hello do
    alias Foo.Bar, as: Bar

    require Foo 

    import Foo

    use Foo
  end

  def plus (a, b) do 
    alias Math.List
  end
end
