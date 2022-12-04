defmodule Advent22.Day02Test do
  use ExUnit.Case

  import Advent22.Day02

  @input """
  A Y
  B X
  C Z
  """

  test "part1" do
    assert 8 = score('A Y')
    assert 1 = score('B X')
    assert 6 = score('C Z')
    assert 15 = part1(@input)
  end

  test "part2" do
    assert 4 = score2('A Y')
    assert 1 = score2('B X')
    assert 7 = score2('C Z')
    assert 12 = part2(@input)
  end
end
