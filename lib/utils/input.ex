defmodule Advent22.Utils.Input do
  @input_dir "priv/inputs"
  def download(day) do
    {:ok, %{status_code: 200, body: body}} =
      HTTPoison.get(
        "https://adventofcode.com/2021/day/#{day}/input",
        [{"cookie", "session=" <> System.get_env("AOC_SESSION")}]
      )

    # write the body to disk
    :ok = File.mkdir_p(@input_dir)
    :ok = File.write(path(day), body)
    body
  end

  def read(day) do
    day
    |> path
    |> File.exists?()
    |> case do
      true -> day |> path |> File.read!()
      _ -> download(day)
    end
  end

  def to_lines(input, keep_blank \\ false) do
    input
    |> String.split("\n", trim: !keep_blank)
  end

  def lines_to_ints(data),
    do: split_to_ints(data, "\n")

  def csv_to_ints(data),
    do: split_to_ints(data, ",")

  def lines_to_chars(data) do
    data
    |> to_lines()
    |> Enum.map(fn line ->
      String.split(line, "", trim: true)
    end)
  end

  defp split_to_ints(data, sep) do
    data
    |> String.trim()
    |> String.split(sep, trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end

  defp path(day),
    do: Path.join(@input_dir, "#{day}.txt")
end
