defmodule Chapter17Test do
  use ExUnit.Case
  doctest Chapter17

  test "greets the world" do
    assert Chapter17.hello() == :world
  end
end
