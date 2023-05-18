defmodule Chapter10Test do
  use ExUnit.Case
  doctest Chapter10

  test "greets the world" do
    assert Chapter10.hello() == :world
  end
end
