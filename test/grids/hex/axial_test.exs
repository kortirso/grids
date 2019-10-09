defmodule Grids.Hex.AxialTest do
  use ExUnit.Case

  alias Grids.Hex.Axial

  describe ".new" do
    test "creates new axial hex tile" do
      %Axial{x: 0, y: 0} = Axial.new([0, 0])
    end
  end
end
