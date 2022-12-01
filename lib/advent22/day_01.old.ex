defmodule Advent22.Day01old do
  alias Advent22.Utils.Input

  def part1(input) do
    input
    |> Input.lines_to_ints(false)
    |> Enum.reduce({0, nil}, fn current, {count, prev} ->
      if prev && prev < current do
        {count + 1, current}
      else
        {count, current}
      end
    end)
  end

  def part2(input) do
    input
    |> Input.lines_to_ints()
    |> Enum.reduce({0, []}, fn current, {count, last} ->
      last = Enum.take([current | last], 4)

      case last do
        [d, c, b, a] ->
          if a + b + c < b + c + d do
            {count + 1, last}
          else
            {count, last}
          end

        _ ->
          {count, last}
      end
    end)
  end
end
