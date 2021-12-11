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

  def parse_file_to_lines(ftext) do
    ftext
    |> String.split("\n", trim: true)
  end

  def parse_file(ftext) do
    ftext
    |> parse_file_to_lines
    |> Enum.map(fn x -> x |> String.to_integer() end)
  end

  def get_and_parse_directions(fname) do
    fname
    |> read_file
    |> parse_directions
  end

  def parse_one_directionline(line) do
    onedir = line |> String.split()
    magnitude = Enum.at(onedir, 1) |> String.to_integer()
    {Enum.at(onedir, 0), magnitude}
  end

  def parse_directions(ftext) do
    ftext
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> x |> parse_one_directionline end)
  end

  def parse_bits(line) do
    Regex.scan(~r/./, line)
    |> Enum.map(fn x -> x |> hd |> String.to_integer() end)
  end

  def transpose(rows) do
    rows
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
