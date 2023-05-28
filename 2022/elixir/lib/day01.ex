defmodule Day01.Part1 do
  def solve(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(&sum_lines/1)
    |> Enum.max()
  end

  def sum_lines(lines) do
    lines
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end

defmodule Day01.Part2 do
  def solve(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(&Day01.Part1.sum_lines/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end

defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    case File.read("input/day01.txt") do
      {:ok, input} ->
        IO.puts("Part One: #{Day01.Part1.solve(input)}")
        IO.puts("Part Two: #{Day01.Part2.solve(input)}")

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
