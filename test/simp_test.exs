defmodule SimpTest do
  use ExUnit.Case

  doctest Simp.Hello

  test "greets the world" do
    assert Simp.Hello.world() == :world
  end

  test "converst string to uppercase" do
    assert %{"data" => "ABCD"} = Simp.Hello.upcase(%{"data" => "abcD"})
  end
end
