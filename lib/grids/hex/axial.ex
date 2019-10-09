defmodule Grids.Hex.Axial do
  @moduledoc """
  Documentation for Grids.Hex.Axial
  """

  alias Grids.Hex.Axial

  defstruct x: 0, y: 0

  @doc """
  Creates a hex tile with axial coordinates

  ## Examples

      iex> Grids.Hex.Axial.new([0, 0])
      %Grids.Hex.Axial{x: 0, y: 0}

  """
  def new([x, y]) when is_integer(x) and is_integer(y), do: %Axial{x: x, y: y}
end
