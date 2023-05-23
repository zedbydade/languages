defmodule Chapter20Test do
  use ExUnit.Case
  doctest Chapter20

  test "greets the world" do
    assert Chapter20.hello() == :world
  end
end
