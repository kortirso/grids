defmodule Grids.Hex.Offset do
  @moduledoc """
  Documentation for Grids.Hex.Offset
  """

  alias Grids.Hex.Offset

  defstruct x: 0, y: 0, orientation: :flat, offset: :odd, parity: :odd

  @doc """
  Creates a hex tile with offset coordinates

  ## Examples

      iex> Grids.Hex.Offset.new([0, 0, 0], %{orientation: :flat, offset: :odd})
      %Grids.Hex.Offset{x: 0, y: 0, orientation: :flat, offset: :odd}

  """
  def new([x, y], options) when is_integer(x) and is_integer(y) do
    attributes = %{orientation: :flat, offset: :odd} |> Map.merge(options)
    parity = find_parity(rem(x, 2), rem(y, 2), attributes.orientation, attributes.offset)

    %Offset{x: x, y: y, orientation: attributes.orientation, offset: attributes.offset, parity: parity}
  end

  def find_parity(0, _, :flat, :odd), do: :even
  def find_parity(1, _, :flat, :odd), do: :odd
  def find_parity(0, _, :flat, :even), do: :odd
  def find_parity(1, _, :flat, :even), do: :even
  def find_parity(_, 0, :pointy, :odd), do: :even
  def find_parity(_, 1, :pointy, :odd), do: :odd
  def find_parity(_, 0, :pointy, :even), do: :odd
  def find_parity(_, 1, :pointy, :even), do: :even

  @doc """
  Returns 6 neighbors for hex tile

  ## Examples

      iex> Grids.Hex.Offset.neighbors(%Offset{})
      [%Offset{}, ...]

  """
  def neighbors(%Offset{x: x, y: y, orientation: orientation, offset: offset, parity: parity}),
    do: do_neighbors(x, y, orientation, offset, parity)

  def do_neighbors(x, y, :flat, :odd, :odd) do
    [
      %Offset{x: x + 1, y: y + 1}, %Offset{x: x + 1, y: y}, %Offset{x: x, y: y - 1},
      %Offset{x: x - 1, y: y}, %Offset{x: x - 1, y: y + 1}, %Offset{x: x, y: y + 1}
    ]
  end

  def do_neighbors(x, y, :flat, :odd, :even) do
    [
      %Offset{x: x + 1, y: y}, %Offset{x: x + 1, y: y - 1}, %Offset{x: x, y: y - 1},
      %Offset{x: x - 1, y: y - 1}, %Offset{x: x - 1, y: y}, %Offset{x: x, y: y + 1}
    ]
  end

  def do_neighbors(x, y, :pointy, :odd, :odd) do
    [
      %Offset{x: x + 1, y: y + 1}, %Offset{x: x + 1, y: y}, %Offset{x: x + 1, y: y - 1},
      %Offset{x: x, y: y - 1}, %Offset{x: x - 1, y: y}, %Offset{x: x, y: y + 1}
    ]
  end

  def do_neighbors(x, y, :pointy, :odd, :even) do
    [
      %Offset{x: x, y: y + 1}, %Offset{x: x + 1, y: y}, %Offset{x: x, y: y - 1},
      %Offset{x: x - 1, y: y - 1}, %Offset{x: x - 1, y: y}, %Offset{x: x - 1, y: y + 1}
    ]
  end

  def do_neighbors(x, y, orientation, :even, :odd), do: do_neighbors(x, y, orientation, :odd, :even)
  def do_neighbors(x, y, orientation, :even, :even), do: do_neighbors(x, y, orientation, :odd, :odd)
end
