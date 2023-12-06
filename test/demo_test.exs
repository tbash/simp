defmodule DemoTest do
  use ExUnit.Case

  doctest Demo.Hello

  test "greets the world" do
    assert Demo.Hello.run() == :world
  end
end
