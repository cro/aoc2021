defmodule AdventOfCode.Day02 do
  use AdventOfCode
  alias AdventOfCode.Utils

  @moduledoc """
  #{readme("resources/day02/README.md")}
  """

  @impl true
  def run do
    input = Utils.get_and_parse_directions("resources/day02/input.txt")

    IO.puts("--- Part One ---")
    IO.inspect(part_one(input))

    IO.puts("--- Part Two ---")
    IO.puts("Result: #{part_two(input)}")
  end

  def move_sub({movement, units}, position) do
    cond do
      movement == "forward" ->
        %{position | horizontal: position.horizontal + units}

      movement == "up" ->
        %{position | vertical: position.vertical - units}

      movement == "down" ->
        %{position | vertical: position.vertical + units}
    end
  end

  def aim_sub({movement, units}, position) do
    cond do
      movement == "forward" ->
        %{
          position
          | horizontal: position.horizontal + units,
            vertical: position.vertical + position.aim * units
        }

      movement == "up" ->
        %{position | aim: position.aim - units}

      movement == "down" ->
        %{position | aim: position.aim + units}
    end
  end

  def part_one_location(directions) do
    directions
    |> Enum.reduce(%{:horizontal => 0, :vertical => 0}, fn x, acc -> move_sub(x, acc) end)
  end

  def part_one(directions) do
    location = directions |> part_one_location()
    location.horizontal * location.vertical
  end

  def part_two_location(directions) do
    directions
    |> Enum.reduce(%{:horizontal => 0, :vertical => 0, :aim => 0}, fn x, acc ->
      aim_sub(x, acc)
    end)
  end

  def part_two(directions) do
    location = directions |> part_two_location()
    location.horizontal * location.vertical
  end
end
