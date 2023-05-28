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

    [common | _] = MapSet.intersection(MapSet.new(first), MapSet.new(second)) |> MapSet.to_list()

    find_score(common)
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
    [one, two, three] = lines

    one = String.codepoints(one)
    two = String.codepoints(two)
    three = String.codepoints(three)

    set1 = MapSet.new(one)
    set2 = MapSet.new(two)
    set3 = MapSet.new(three)

    common_one = MapSet.intersection(set1, set2)
    [letter | _] = MapSet.intersection(common_one, set3) |> MapSet.to_list()

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
