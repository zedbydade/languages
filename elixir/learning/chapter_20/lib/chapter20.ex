defmodule Chapter20 do
  @moduledoc """
  Documentation for `Chapter20`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chapter20.hello()
      :world

  """
  def hello do
    length([1, 2, 3]) == length [1, 2, 3]

    if true do 
      :this 
    else  
      :that
    end

    if true, do: :this, else: :that
  end
end
