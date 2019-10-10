defmodule Grids.Hex.Offset do
  @moduledoc """
  Documentation for Grids.Hex.Offset
  """

  alias Grids.Hex.Offset

  defstruct x: 0, y: 0, orientation: :flat, offset: :odd

  @doc """
  Creates a hex tile with offset coordinates

  ## Examples

      iex> Grids.Hex.Offset.new([0, 0, 0], %{orientation: :flat, offset: :odd})
      %Grids.Hex.Offset{x: 0, y: 0, orientation: :flat, offset: :odd}

  """
  def new([x, y], options) when is_integer(x) and is_integer(y) do
    attributes = %{orientation: :flat, offset: :odd} |> Map.merge(options)

    %Offset{x: x, y: y, orientation: attributes.orientation, offset: attributes.offset}
  end

  @doc """
  Returns 6 neighbors for hex tile

  ## Examples

      iex> Grids.Hex.Offset.neighbors(%Offset{})
      [%Offset{}, ...]

  """
  def neighbors(%Offset{x: x, y: y, orientation: :flat, offset: :odd}, %{parity: :odd}) do
    [
      %Offset{x: x + 1, y: y + 1}, %Offset{x: x + 1, y: y}, %Offset{x: x, y: y - 1},
      %Offset{x: x - 1, y: y}, %Offset{x: x - 1, y: y + 1}, %Offset{x: x, y: y + 1}
    ]
  end

  def neighbors(%Offset{x: x, y: y, orientation: :flat, offset: :odd}, %{parity: :even}) do
    [
      %Offset{x: x + 1, y: y}, %Offset{x: x + 1, y: y - 1}, %Offset{x: x, y: y - 1},
      %Offset{x: x - 1, y: y - 1}, %Offset{x: x - 1, y: y}, %Offset{x: x, y: y + 1}
    ]
  end

  def neighbors(%Offset{x: x, y: y, orientation: :flat, offset: :even}, %{parity: :odd}),
    do: neighbors(%Offset{x: x, y: y, orientation: :flat, offset: :odd}, %{parity: :even})

  def neighbors(%Offset{x: x, y: y, orientation: :flat, offset: :even}, %{parity: :even}),
    do: neighbors(%Offset{x: x, y: y, orientation: :flat, offset: :odd}, %{parity: :odd})

  def neighbors(%Offset{x: x, y: y, orientation: :pointy, offset: :odd}, %{parity: :odd}) do
    [
      %Offset{x: x + 1, y: y + 1}, %Offset{x: x + 1, y: y}, %Offset{x: x + 1, y: y - 1},
      %Offset{x: x, y: y - 1}, %Offset{x: x - 1, y: y}, %Offset{x: x, y: y + 1}
    ]
  end

  def neighbors(%Offset{x: x, y: y, orientation: :pointy, offset: :odd}, %{parity: :even}) do
    [
      %Offset{x: x, y: y + 1}, %Offset{x: x + 1, y: y}, %Offset{x: x, y: y - 1},
      %Offset{x: x - 1, y: y - 1}, %Offset{x: x - 1, y: y}, %Offset{x: x - 1, y: y + 1}
    ]
  end

  def neighbors(%Offset{x: x, y: y, orientation: :pointy, offset: :even}, %{parity: :odd}),
    do: neighbors(%Offset{x: x, y: y, orientation: :pointy, offset: :odd}, %{parity: :even})

  def neighbors(%Offset{x: x, y: y, orientation: :pointy, offset: :even}, %{parity: :even}),
    do: neighbors(%Offset{x: x, y: y, orientation: :pointy, offset: :odd}, %{parity: :odd})
end
