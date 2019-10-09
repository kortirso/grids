defmodule Grids.Square do
  @moduledoc """
  Documentation for Grids.Square
  """

  alias Grids.Square

  defstruct x: 0, y: 0

  @doc """
  Creates a square tile

  ## Examples

      iex> Grids.Square.new([0, 0])
      %Grids.Square{x: 0, y: 0}

  """
  def new([x, y]), do: %Square{x: x, y: y}
end
