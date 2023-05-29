defmodule Day04.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&find_overlap/1)
    |> Enum.map(&calculate_total/1)
    |> Enum.flat_map(fn x -> x end)
    |> Enum.sum()
  end

  def find_overlap(line) do
    line
    |> String.split(",")
    |> Enum.map(fn x ->
      x
      |> String.split("-", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.map(fn x ->
      [first, second] = x
      Enum.to_list(first..second)
    end)
    |> Enum.map(&MapSet.new/1)
    |> Enum.chunk_every(2)
  end

  def calculate_total(line) do
    line
    |> Enum.map(fn [first, second] ->
      common = MapSet.intersection(first, second) |> MapSet.to_list()

      cond do
        length(common) == MapSet.size(first) -> 1
        length(common) == MapSet.size(second) -> 1
        true -> 0
      end
    end)
  end
end

defmodule Day04.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&Day04.Part1.find_overlap/1)
    |> Enum.map(&calculate_total/1)
    |> Enum.flat_map(fn x -> x end)
    |> Enum.sum()
  end

  def calculate_total(line) do
    line
    |> Enum.map(fn [first, second] ->
      common = MapSet.intersection(first, second) |> MapSet.to_list()

      cond do
        length(common) > 0 -> 1
        true -> 0
      end
    end)
  end
end

defmodule Mix.Tasks.Day04 do
  use Mix.Task

  def run(_) do
    case File.read("input/day04.txt") do
      {:ok, input} ->
        IO.puts("Part One: #{Day04.Part1.solve(input)}")
        IO.puts("Part Two: #{Day04.Part2.solve(input)}")

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
