defmodule Day01Test do
  use ExUnit.Case

  @example_input """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  test "part one should equal 24000" do
    assert Day01.Part1.solve(@example_input) == 24000
  end

  test "part two should equal 45000" do
    assert Day01.Part2.solve(@example_input) == 45000
  end
end
