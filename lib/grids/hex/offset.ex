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
end
