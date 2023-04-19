defmodule Chapter9Test do
  use ExUnit.Case
  doctest Chapter9

  test "greets the world" do
    assert Chapter9.hello() == :world
  end
end
