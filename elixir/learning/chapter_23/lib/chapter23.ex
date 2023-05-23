defmodule Chapter23 do
  @moduledoc """
  Documentation for `Chapter23`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chapter23.hello()
      :world

  """
  def hello do
    @typedoc """
    A 4 digit year
    """
    @type year :: integer 

    @spec current_age(year) :: integer 

    @spec add(number, number) :: {number, String.t}
    def add(x, y), do: {x + y, "You need a calculator to do that?!"}

    @spec multiply(number, number) :: {number, String.t}
    def multiply(x, y), do: {x * y, "Jeez, come on!"}



  end
end
