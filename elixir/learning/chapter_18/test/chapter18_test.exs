defmodule Chapter18Test do
  use ExUnit.Case
  doctest Chapter18

  test "greets the world" do
    assert Chapter18.hello() == :world
  end
end
