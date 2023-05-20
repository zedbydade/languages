defmodule Chapter15Test do
  use ExUnit.Case
  doctest Chapter15

  test "greets the world" do
    assert Chapter15.hello() == :world
  end
end
