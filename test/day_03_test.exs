defmodule Advent22.Day03Test do
  use ExUnit.Case

  import Advent22.Day03

  @input """
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """
  test "part1" do
    # assert [16, 38, 42, 22, 20, 19] = part1(@input)
    assert 157 = part1(@input)
  end

  test "part2" do
    # assert [18, 52] = part2(@input)
    assert 70 = part2(@input)
  end
end
