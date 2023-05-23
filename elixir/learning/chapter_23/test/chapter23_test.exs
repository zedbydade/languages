defmodule Chapter23Test do
  use ExUnit.Case
  doctest Chapter23

  test "greets the world" do
    assert Chapter23.hello() == :world
  end
end
