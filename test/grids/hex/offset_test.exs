defmodule Grids.Hex.OffsetTest do
  use ExUnit.Case

  alias Grids.Hex.Offset

  describe ".new" do
    test "creates new offset hex tile" do
      %Offset{x: 0, y: 0, orientation: :flat, offset: :odd} = Offset.new([0, 0], %{})
    end
  end
end
