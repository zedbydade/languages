defmodule Chapter22Test do
  use ExUnit.Case
  doctest Chapter22

  test "greets the world" do
    assert Chapter22.hello() == :world
  end
end
