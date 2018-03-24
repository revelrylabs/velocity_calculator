defmodule VelocityTest do
  use ExUnit.Case
  doctest Velocity

  test "greets the world" do
    assert Velocity.hello() == :world
  end
end
