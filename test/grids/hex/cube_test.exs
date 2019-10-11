defmodule Grids.Hex.CubeTest do
  use ExUnit.Case

  alias Grids.Hex.Cube

  describe ".new" do
    test "valid data, creates new axial hex tile" do
      %Cube{x: 0, y: 0, z: 0} = Cube.new([0, 0, 0])
    end

    test "invalid data, does not create new axial hex tile" do
      {:error, "Invalid coordinates in cube system"} = Cube.new([0, 0, -1])
    end
  end

  describe ".neighbors" do
    test "returns neighbors of cube tile" do
      result = Cube.new([0, 0, 0]) |> Cube.neighbors()

      assert result == [
        %Cube{x: 1, y: -1, z: 0}, %Cube{x: 1, y: 0, z: -1}, %Cube{x: 0, y: 1, z: -1},
        %Cube{x: -1, y: 1, z: 0}, %Cube{x: -1, y: 0, z: 1}, %Cube{x: 0, y: -1, z: 1}
      ]
    end
  end
end
