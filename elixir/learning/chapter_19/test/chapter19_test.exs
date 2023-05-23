defmodule Chapter19Test do
  use ExUnit.Case
  doctest Chapter19

  test "greets the world" do
    assert Chapter19.hello() == :world
  end
end
