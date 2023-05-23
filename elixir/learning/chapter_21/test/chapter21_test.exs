defmodule Chapter21Test do
  use ExUnit.Case
  doctest Chapter21

  test "greets the world" do
    assert Chapter21.hello() == :world
  end
end
