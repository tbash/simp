defmodule Simp.Hello do
  @moduledoc """
  Documentation for `Simp.Hello`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Simp.Hello.world()
      :world

  """
  def world do
    :world
  end

  @doc """
  Convert :data in map to uppercase string

  ## Examples

      iex> Simp.Hello.upcase(%{data: "abcd"})
      %{data: "ABCD"}

  """
  def upcase(%{"data" => data}) do
    %{"data" => String.upcase(data)}
  end
end
