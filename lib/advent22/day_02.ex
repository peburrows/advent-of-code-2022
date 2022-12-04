defmodule Advent22.Day02 do
  alias Advent22.Utils.Input

  @pairs %{
    ?X => ?A,
    ?Y => ?B,
    ?Z => ?C
  }

  @outcome %{
    ?X => :lose,
    ?Y => :draw,
    ?Z => :win
  }

  def part1(input) do
    input
    |> Input.to_lines()
    |> Enum.map(fn l ->
      String.to_charlist(l) |> score()
    end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Input.to_lines()
    |> Enum.map(fn l ->
      String.to_charlist(l) |> score2()
    end)
    |> Enum.sum()
  end

  def score([them, _, me]) do
    me = @pairs[me]
    game(me, them) + me - 64
  end

  def score2([them, _, me]) do
    me = move(them, @outcome[me])
    game(me, them) + me - 64
  end

  def game(me, them) when me == them, do: 3
  def game(?A, ?B), do: 0
  def game(?A, ?C), do: 6
  def game(?B, ?C), do: 0
  def game(?B, ?A), do: 6
  def game(?C, ?A), do: 0
  def game(?C, ?B), do: 6

  @moves [?A, ?B, ?C]
  def move(them, :draw), do: them
  def move(them, :win), do: find_move(them, 1)
  def move(them, :lose), do: find_move(them, 2)

  defp find_move(them, offset) do
    Enum.at(
      @moves,
      rem(Enum.find_index(@moves, fn i -> i == them end) + offset, 3)
    )
  end
end
