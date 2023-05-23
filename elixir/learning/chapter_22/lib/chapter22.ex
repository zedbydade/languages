defmodule Chapter22 do
  @moduledoc """
  Documentation for `Chapter22`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chapter22.hello()
      :world

  """
  def hello do
    (1..10)
    |> IO.inspect
    |> Enum.map(fn x -> x * 2 end)
    |> IO.inspect
    |> Enum.sum 
    |> IO.inspect
  end
end
