defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part one" do
    input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    result = part_one(input)
    assert result == {263, 7}
  end

  test "part two" do
    input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    result = part_two(input)
    assert result == 5
  end
end
