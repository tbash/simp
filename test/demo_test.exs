defmodule DemoTest do
  use ExUnit.Case

  doctest Demo.Hello

  test "greets the world" do
    assert Demo.Hello.world() == :world
  end

  test "converst string to uppercase" do
    assert %{"data" => "ABCD"} = Demo.Hello.upcase(%{"data" => "abcD"})
  end
end
