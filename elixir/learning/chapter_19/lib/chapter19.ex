defmodule Chapter19 do
  @moduledoc """
  Documentation for `Chapter19`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chapter19.hello()
      :world

  """
  defexception message: 'default message'
  def hello do
    try do 
      raise "oops"
    rescue 
      e in RuntimeError -> e
    end
  end

  case File.read("hello") do 
    {:ok, body} -> IO.puts("Success: #{body}")
    {:error, reason} -> IO.puts("Error: #{reason}")
  end
end
