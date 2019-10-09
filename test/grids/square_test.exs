defmodule Grids.SquareTest do
  use ExUnit.Case

  alias Grids.Square

  describe ".new" do
    test "creates new square tile" do
      %Square{x: 0, y: 0} = Square.new([0, 0])
    end
  end
end
