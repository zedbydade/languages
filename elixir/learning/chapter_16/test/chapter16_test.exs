defmodule Chapter16Test do
  use ExUnit.Case
  doctest Chapter16

  test "greets the world" do
    assert Chapter16.hello() == :world
  end
end
