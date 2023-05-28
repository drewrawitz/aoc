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

  def find_score(letter) do
    index = Enum.find_index(alphabet(), fn x -> x == to_string(letter) end)

    # Index starts at 0 so we need to add one to get the score
    index + 1
  end

  def calculate_priority(line) do
    [first, second] =
      String.split_at(line, div(String.length(line), 2))
      |> Tuple.to_list()
      |> Enum.map(&String.codepoints/1)

    letter = MapSet.intersection(MapSet.new(first), MapSet.new(second)) |> MapSet.to_list() |> hd

    find_score(letter)
  end
end

defmodule Day03.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(&calculate_priority/1)
    |> Enum.sum()
  end

  def calculate_priority(lines) do
    [one, two, three] =
      Enum.map(lines, fn line ->
        String.codepoints(line)
        |> MapSet.new()
      end)

    common_one = MapSet.intersection(one, two)
    letter = MapSet.intersection(common_one, three) |> MapSet.to_list() |> hd

    Day03.Part1.find_score(letter)
  end
end

defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    case File.read("input/day03.txt") do
      {:ok, input} ->
        IO.puts("Part One: #{Day03.Part1.solve(input)}")
        IO.puts("Part Two: #{Day03.Part2.solve(input)}")

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
