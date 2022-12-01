defmodule Advent22.Day01 do
  alias Advent22.Utils.Input

  def part1(input) do
    Input.to_lines(input, true)
    |> Enum.reduce({0, 0}, fn i, {sum, gmax} ->
      i
      |> String.trim()
      |> case do
        "" -> {0, max(sum, gmax)}
        num -> {sum + String.to_integer(num), gmax}
      end
    end)
  end

  def part2(input) do
  end
end
