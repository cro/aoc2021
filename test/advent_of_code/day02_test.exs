defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02
  alias AdventOfCode.Utils

  @testinput """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """

  test "one directionline" do
    assert Utils.parse_one_directionline("forward 5") == {"forward", 5}
  end

  test "parse input" do
    parsed = Utils.parse_directions(@testinput)

    assert parsed == [
             {"forward", 5},
             {"down", 5},
             {"forward", 8},
             {"up", 3},
             {"down", 8},
             {"forward", 2}
           ]
  end

  test "moving sub" do
    location = move_sub({"forward", 2}, %{:horizontal => 0, :vertical => 0})
    assert location == %{:horizontal => 2, :vertical => 0}
    location = move_sub({"up", 2}, %{:horizontal => 0, :vertical => 0})
    assert location == %{:horizontal => 0, :vertical => -2}
  end

  test "part one location" do
    input = @testinput |> Utils.parse_directions()
    result = part_one_location(input)
    assert result == %{:horizontal => 15, :vertical => 10}
  end

  test "part one" do
    input = @testinput |> Utils.parse_directions()
    result = part_one(input)
    assert result == 150
  end

  test "aiming sub" do
    location = aim_sub({"forward", 2}, %{:horizontal => 0, :vertical => 0, :aim => 0})
    assert location == %{:horizontal => 2, :vertical => 0, :aim => 0}
    location = aim_sub({"down", 2}, %{:horizontal => 0, :vertical => 0, :aim => 0})
    assert location == %{:horizontal => 0, :vertical => 0, :aim => 2}
    location = aim_sub({"forward", 2}, %{:horizontal => 0, :vertical => 0, :aim => 2})
    assert location == %{:horizontal => 2, :vertical => 4, :aim => 2}
  end

  test "part two location" do
    input = @testinput |> Utils.parse_directions()
    result = part_two_location(input)
    assert result == %{:horizontal => 15, :vertical => 60, :aim => 10}
  end

  test "part two" do
    input = @testinput |> Utils.parse_directions()
    result = part_two(input)
    assert result == 900
  end
end
