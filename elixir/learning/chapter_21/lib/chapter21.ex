defmodule Chapter21 do
  @moduledoc """
  Documentation for `Chapter21`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chapter21.hello()
      :world

  """
  def hello do
    :io.format("Pi is approximately given by:10.3fn", [:math.pi])
  end
end
