defmodule Day02.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end

  def score_round(line) do
    outcome =
      case line do
        x when x in ["A Y", "B Z", "C X"] -> 6
        x when x in ["A X", "B Y", "C Z"] -> 3
        x when x in ["A Z", "B X", "C Y"] -> 0
      end

    bonus =
      case String.last(line) do
        "X" -> 1
        "Y" -> 2
        "Z" -> 3
      end

    outcome + bonus
  end
end

# defmodule Day01.Part2 do
#   def solve(input) do
#     input
#     |> String.split("\n\n", trim: true)
#     |> Enum.map(&Day01.Part1.sum_lines/1)
#     |> Enum.sort(:desc)
#     |> Enum.take(3)
#     |> Enum.sum()
#   end
# end

defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    case File.read("input/day02.txt") do
      {:ok, input} ->
        IO.puts("Part One: #{Day02.Part1.solve(input)}")

      # IO.puts("Part Two: #{Day02.Part2.solve(input)}")

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
