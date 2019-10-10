defmodule Grids.Hex do
  @moduledoc """
  Documentation for Grids.Hex
  """

  alias Grids.{Hex.Cube, Hex.Axial, Hex.Offset}

  @doc """
  Creates a hex tile

  ## Examples

      iex> Grids.Hex.new(:cube, [0, 0, 0])
      %Grids.Hex.Cube{x: 0, y: 0, z: 0}

  """
  def new(system, coordinates, options \\ %{}) when is_atom(system) and is_list(coordinates) and is_map(options), do: do_new(system, coordinates, options)

  def do_new(:cube, coordinates, _), do: Cube.new(coordinates)
  def do_new(:axial, coordinates, _), do: Axial.new(coordinates)
  def do_new(:offset, coordinates, options), do: Offset.new(coordinates, options)
  def do_new(_, _, _), do: {:error, "Unknown coordinates system"}

  @doc """
  Returns 6 neighbors for hex tile

  ## Examples

      iex> Grids.Hex.neighbors(%Cube{})
      [%Cube{}, ...]

  """
  def neighbors(tile, options \\ %{}) when is_map(options), do: do_neighbors(tile, options)

  def do_neighbors(%Cube{} = tile, _), do: Cube.neighbors(tile)
  def do_neighbors(%Axial{} = tile, _), do: Axial.neighbors(tile)
  def do_neighbors(%Offset{} = tile, options), do: Offset.neighbors(tile, options)
  def do_neighbors(_, _), do: {:error, "Unknown coordinates system"}
end
