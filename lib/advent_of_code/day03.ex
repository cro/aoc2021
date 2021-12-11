defmodule AdventOfCode.Day03 do
  use AdventOfCode

  @moduledoc """
  #{ readme("resources/day03/README.md") }
  """

  @impl true
  def run do
    {:ok, input} = File.read("resources/day03/input.txt")

    IO.puts("--- Part One ---")
    IO.puts("Result: #{part_one(input)}")

    IO.puts("--- Part Two ---")
    IO.puts("Result: #{part_two(input)}")
  end

  def part_one(_args) do
  end

  def part_two(_args) do
  end
end
