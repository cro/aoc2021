defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03
  alias AdventOfCode.Utils

  @sample """
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
  """

  test "transpose" do
    input = [
      [0, 1, 0, 1],
      [1, 0, 1, 0],
      [1, 1, 1, 1]
    ]

    output = Utils.transpose(input)

    assert output == [
             [0, 1, 1],
             [1, 0, 1],
             [0, 1, 1],
             [1, 0, 1]
           ]
  end

  test "parse_bits" do
    assert Utils.parse_bits("01001111") == [0, 1, 0, 0, 1, 1, 1, 1]
  end

  test "read and parse_bits" do
    assert @sample
           |> Utils.parse_file_to_lines()
           |> Enum.map(&Utils.parse_bits/1) ==
             [
               [0, 0, 1, 0, 0],
               [1, 1, 1, 1, 0],
               [1, 0, 1, 1, 0],
               [1, 0, 1, 1, 1],
               [1, 0, 1, 0, 1],
               [0, 1, 1, 1, 1],
               [0, 0, 1, 1, 1],
               [1, 1, 1, 0, 0],
               [1, 0, 0, 0, 0],
               [1, 1, 0, 0, 1],
               [0, 0, 0, 1, 0],
               [0, 1, 0, 1, 0]
             ]
  end

  test "part one" do
    input = nil
    result = part_one(input)
    assert result == nil
  end

  test "part two" do
    input = nil
    result = part_two(input)
    assert result == nil
  end
end
