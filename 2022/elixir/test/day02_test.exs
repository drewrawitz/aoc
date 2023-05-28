defmodule Day02Test do
  use ExUnit.Case

  @example_input """
  A Y
  B X
  C Z
  """

  test "part one should equal 15" do
    assert Day02.Part1.solve(@example_input) == 15
  end

  # test "part two should equal 45000" do
  #   assert Day02.Part2.solve(@example_input) == 45000
  # end
end
