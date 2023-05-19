defmodule Chapter14Test do
  use ExUnit.Case
  doctest Chapter14

  test "greets the world" do
    assert Chapter14.hello() == :world
  end
end
