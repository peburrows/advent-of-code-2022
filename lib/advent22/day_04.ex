defmodule Advent22.Day04 do
  alias Advent22.Utils.Input

  def part1(input) do
    input
    |> Input.to_lines()
    |> Enum.reduce(0, fn line, sum ->
      [a, b] = String.split(line, ",")
      if fully_contained?(a, b), do: sum + 1, else: sum
    end)
  end

  def part2(input) do
    input
    |> Input.to_lines()
    |> Enum.reduce(0, fn line, sum ->
      [a, b] = String.split(line, ",")
      if overlap?(a, b), do: sum + 1, else: sum
    end)
  end

  defp fully_contained?(a, b) do
    [a1, a2] = String.split(a, "-") |> Enum.map(&String.to_integer/1)
    [b1, b2] = String.split(b, "-") |> Enum.map(&String.to_integer/1)

    (b1 <= a1 && b2 >= a2) || (a1 <= b1 && a2 >= b2)
  end

  defp overlap?(a, b) do
    [a1, a2] = String.split(a, "-") |> Enum.map(&String.to_integer/1)
    [b1, b2] = String.split(b, "-") |> Enum.map(&String.to_integer/1)

    !Range.disjoint?(a1..a2, b1..b2)
  end
end
