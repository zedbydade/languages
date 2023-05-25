defmodule Chapter13Test do
  use ExUnit.Case
  doctest Chapter13

  test "greets the world" do
    assert Chapter13.hello() == :world
  end
end
