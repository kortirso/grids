defmodule Grids.Hex.AxialTest do
  use ExUnit.Case

  alias Grids.Hex.Axial

  describe ".new" do
    test "creates new axial hex tile" do
      %Axial{x: 0, y: 0} = Axial.new([0, 0])
    end
  end

  describe ".neighbors" do
    test "returns neighbors of axial tile" do
      result = Axial.new([0, 0]) |> Axial.neighbors()

      assert result == [
        %Axial{x: 1, y: 0}, %Axial{x: 1, y: -1}, %Axial{x: 0, y: -1},
        %Axial{x: -1, y: 0}, %Axial{x: -1, y: 1}, %Axial{x: 0, y: 1}
      ]
    end
  end
end
