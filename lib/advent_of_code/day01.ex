defmodule AdventOfCode.Day01 do
  use AdventOfCode
  alias AdventOfCode.Utils

  @moduledoc """
  #{readme("resources/day01/README.md")}
  """

  @impl true
  def run do
    numbers = Utils.get_and_parse_file("resources/day01/input.txt")

    IO.puts("--- Part One ---")
    IO.puts("Result: #{numbers |> part_one |> elem(1)}")

    IO.puts("--- Part Two ---")
    IO.puts("Result: #{part_two(numbers)}")
  end

  def test_numbers(next, {current, total}) do
    cond do
      next > current ->
        {next, total + 1}

      true ->
        {next, total}
    end
  end

  def part_one(numbers) do
    numbers
    |> Enum.reduce({0, -1}, fn x, acc -> test_numbers(x, acc) end)
  end

  def window_compare({window, last_sum, total}) do
    {window, Enum.sum(window),
     if Enum.sum(window) > last_sum do
       total + 1
     else
       total
     end}
  end

  def sliding_window({window, last_sum, total}, list_of_all) do
    cond do
      length(list_of_all) < 3 ->
        {window, last_sum, total}

      true ->
        next_val = window_compare({Enum.take(list_of_all, 3), last_sum, total})
        sliding_window(next_val, Enum.drop(list_of_all, 1))
    end
  end

  def part_two(numbers) do
    sliding_window(
      {Enum.take(numbers, 3), Enum.sum(Enum.take(numbers, 3)), 0},
      Enum.drop(numbers, 1)
    )
    |> elem(2)
  end
end
