defmodule AdventOfCode.Utils do
  def get_and_parse_file(fname) do
    fname
    |> read_file
    |> parse_file
  end

  def read_file(fname) do
    {:ok, ftext} = File.read(fname)
    ftext
  end

  def parse_file(ftext) do
    ftext
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> x |> String.to_integer() end)
  end
end
