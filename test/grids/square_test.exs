defmodule Grids.SquareTest do
  use ExUnit.Case

  alias Grids.Square

  describe ".new" do
    test "creates new square tile" do
      %Square{x: 0, y: 0} = Square.new([0, 0])
    end
  end

  describe ".neighbors" do
    test "returns neighbors of square tile" do
      result = Square.new([0, 0]) |> Square.neighbors()

      assert result == [
        %Square{x: 1, y: 1}, %Square{x: 1, y: 0}, %Square{x: 1, y: -1},
        %Square{x: 0, y: -1}, %Square{x: -1, y: -1}, %Square{x: -1, y: 0},
        %Square{x: -1, y: 1}, %Square{x: 0, y: 1}
      ]
    end
  end
end
