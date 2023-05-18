defmodule Chapter12Test do
  use ExUnit.Case
  doctest Chapter12

  test "greets the world" do
    assert Chapter12.hello() == :world
  end
end
