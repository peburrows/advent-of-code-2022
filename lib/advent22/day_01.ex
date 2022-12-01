defmodule Advent22.Day01 do
  alias Advent22.Utils.Input

  def part1(input) do
    String.split(input, "\n")
    |> Enum.reduce({0, 0}, fn line, {sum, gmax} ->
      case String.trim(line) do
        "" -> {0, max(sum, gmax)}
        num -> {sum + String.to_integer(num), gmax}
      end
    end)
  end

  def part2(input) do
    String.split(input, "\n")
    |> Enum.reduce({0, []}, fn line, {sum, top} ->
      case String.trim(line) do
        "" -> {0, [sum | top] |> Enum.sort(:desc) |> Enum.take(3)}
        num -> {sum + String.to_integer(num), top}
      end
    end)
    |> elem(1)
    |> Enum.sum()
  end
end
