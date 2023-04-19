defmodule Chapter9 do
  def print_multiple_times(msg, n) when n > 0 do 
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end

  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    
  end
end

Chapter9.print_multiple_times("TUTURU", 3)
IO.puts Chapter9.sum_list([1, 2, 3], 0)
