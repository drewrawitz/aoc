defmodule Day03Test do
  use ExUnit.Case

  @example_input """
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """

  test "part one should equal 157" do
    assert Day03.Part1.solve(@example_input) == 157
  end

  # test "part two should equal 12" do
  #   assert Day02.Part2.solve(@example_input) == 12
  # end
end
