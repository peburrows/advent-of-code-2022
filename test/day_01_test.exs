defmodule Advent22.Day01Test do
  use ExUnit.Case
  import Advent22.Day01

  @case1 """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  test "part1" do
    assert {0, 24000} = part1(@case1)
  end

  @tag :skip
  test "part2" do
  end
end
