defmodule Mix.Tasks.Day.Setup do
  use Mix.Task

  def run([day]) do
    Application.ensure_all_started(:advent22)
    # download the input
    Advent22.Utils.Input.download(day)

    # generate a test file
    {day, contents} = test_file_contents(day)

    if not File.exists?("test/day_#{day}_test.exs") do
      File.mkdir_p("test")
      File.write("test/day_#{day}_test.exs", contents)
    end

    {day, contents} = source_file_contents(day)

    if not File.exists?("lib/advent22/day_#{day}.ex") do
      File.mkdir_p("lib/advent22")
      File.write("lib/advent22/day_#{day}.ex", contents)
    end
  end

  defp test_file_contents(day) do
    day =
      day
      |> to_string
      |> String.pad_leading(2, "0")

    contents =
      """
      defmodule Advent22.Day#{day}Test do
        use ExUnit.Case

        import Advent22.Day#{day}

        test "part1" do
        end

        @tag :skip
        test "part2" do
        end
      end
      """
      |> String.trim()

    {day, contents}
  end

  defp source_file_contents(day) do
    day =
      day
      |> to_string
      |> String.pad_leading(2, "0")

    contents = """
    defmodule Advent22.Day#{day} do
      alias Advent22.Utils.Input

      def part1(input) do
      end

      def part2(input) do
      end
    end
    """

    {day, contents}
  end
end
