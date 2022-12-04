defmodule Advent22.Day03 do
  alias Advent22.Utils.Input

  def part1(input) do
    input
    |> Input.to_lines()
    |> Enum.map(fn line ->
      len = (String.length(line) / 2) |> trunc
      left = String.slice(line, 0..(len - 1)) |> String.to_charlist() |> MapSet.new()
      right = String.slice(line, len..-1) |> String.to_charlist() |> MapSet.new()

      letter = MapSet.intersection(left, right) |> MapSet.to_list() |> hd

      if letter >= 97, do: letter - 96, else: letter - 38
    end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Input.to_lines()
    |> Enum.chunk_every(3)
    |> Enum.map(fn [a, b, c] ->
      a = a |> String.to_charlist() |> MapSet.new()
      b = b |> String.to_charlist() |> MapSet.new()
      c = c |> String.to_charlist() |> MapSet.new()

      letter = MapSet.intersection(a, b) |> MapSet.intersection(c) |> MapSet.to_list() |> hd
      if letter >= 97, do: letter - 96, else: letter - 38
    end)
    |> Enum.sum()
  end
end
