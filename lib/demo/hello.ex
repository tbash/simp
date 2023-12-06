defmodule Demo.Hello do
  @moduledoc """
  Documentation for `Demo.Hello`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Demo.Hello.world()
      :world

  """
  def world do
    :world
  end

  @doc """
  Convert :data in map to uppercase string

  ## Examples

      iex> Demo.Hello.upcase(%{data: "abcd"})
      %{data: "ABCD"}

  """
  def upcase(%{"data" => data}) do
    %{"data" => String.upcase(data)}
  end
end
