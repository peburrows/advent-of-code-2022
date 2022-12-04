defmodule Advent22.Day04Test do
  use ExUnit.Case
  import Advent22.Day04

  @input """
  2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8
  """

  test "part1" do
    assert 2 = part1(@input)
  end

  test "part2" do
    assert 4 = part2(@input)
  end
end
