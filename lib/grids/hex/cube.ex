defmodule Grids.Hex.Cube do
  @moduledoc """
  Documentation for Grids.Hex.Cube
  """

  alias Grids.Hex.Cube

  defstruct x: 0, y: 0, z: 0

  @doc """
  Creates a hex tile with cube coordinates

  ## Examples

      iex> Grids.Hex.Cube.new([0, 0, 0])
      %Grids.Hex.Cube{x: 0, y: 0, z: 0}

  """
  def new([x, y, z]) when is_integer(x) and is_integer(y) and is_integer(z) do
    case x + y + z do
      0 -> %Cube{x: x, y: y, z: z}
      _ -> {:error, "Invalid coordinates in cube system"}
    end
  end
end
