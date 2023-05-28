defmodule Day03.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&calculate_priority/1)
    |> Enum.sum()
  end

  def alphabet do
    lowercase = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    uppercase = String.codepoints("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

    lowercase ++ uppercase
  end

  def calculate_priority(line) do
    [first, second] =
      String.split_at(line, div(String.length(line), 2))
      |> Tuple.to_list()
      |> Enum.map(&String.codepoints/1)

    [common | _] = MapSet.intersection(MapSet.new(first), MapSet.new(second)) |> MapSet.to_list()

    index = Enum.find_index(alphabet(), fn x -> x == to_string(common) end)

    # Index starts at 0 so we need to add one to get the score
    index + 1
  end
end

defmodule Day03.Part2 do
end

defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    case File.read("input/day03.txt") do
      {:ok, input} ->
        IO.puts("Part One: #{Day03.Part1.solve(input)}")

      # IO.puts("Part Two: #{Day02.Part2.solve(input)}")

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
