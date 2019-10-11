defmodule Grids.Hex.OffsetTest do
  use ExUnit.Case

  alias Grids.Hex.Offset

  describe ".new" do
    test "creates new offset hex tile" do
      %Offset{x: 0, y: 0, orientation: :flat, offset: :odd, parity: :even} = Offset.new([0, 0], %{})
    end
  end

  describe ".neighbors" do
    test "returns neighbors of offset tile, orientation flat, offset odd, parity odd" do
      result = Offset.new([1, 1], %{}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 2, y: 2}, %Offset{x: 2, y: 1}, %Offset{x: 1, y: 0},
        %Offset{x: 0, y: 1}, %Offset{x: 0, y: 2}, %Offset{x: 1, y: 2}
      ]
    end

    test "returns neighbors of offset tile, orientation flat, offset odd, parity even" do
      result = Offset.new([2, 2], %{}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 3, y: 2}, %Offset{x: 3, y: 1}, %Offset{x: 2, y: 1},
        %Offset{x: 1, y: 1}, %Offset{x: 1, y: 2}, %Offset{x: 2, y: 3}
      ]
    end


    test "returns neighbors of offset tile, orientation flat, offset even, parity odd" do
      result = Offset.new([2, 2], %{offset: :even}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 3, y: 2}, %Offset{x: 3, y: 1}, %Offset{x: 2, y: 1},
        %Offset{x: 1, y: 1}, %Offset{x: 1, y: 2}, %Offset{x: 2, y: 3}
      ]
    end

    test "returns neighbors of offset tile, orientation flat, offset even, parity even" do
      result = Offset.new([1, 1], %{offset: :even}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 2, y: 2}, %Offset{x: 2, y: 1}, %Offset{x: 1, y: 0},
        %Offset{x: 0, y: 1}, %Offset{x: 0, y: 2}, %Offset{x: 1, y: 2}
      ]
    end

    test "returns neighbors of offset tile, orientation pointy, offset odd, parity odd" do
      result = Offset.new([1, 1], %{orientation: :pointy}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 2, y: 2}, %Offset{x: 2, y: 1}, %Offset{x: 2, y: 0},
        %Offset{x: 1, y: 0}, %Offset{x: 0, y: 1}, %Offset{x: 1, y: 2}
      ]
    end

    test "returns neighbors of offset tile, orientation pointy, offset odd, parity even" do
      result = Offset.new([2, 2], %{orientation: :pointy}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 2, y: 3}, %Offset{x: 3, y: 2}, %Offset{x: 2, y: 1},
        %Offset{x: 1, y: 1}, %Offset{x: 1, y: 2}, %Offset{x: 1, y: 3}
      ]
    end

    test "returns neighbors of offset tile, orientation pointy, offset even, parity odd" do
      result = Offset.new([2, 2], %{orientation: :pointy, offset: :even}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 2, y: 3}, %Offset{x: 3, y: 2}, %Offset{x: 2, y: 1},
        %Offset{x: 1, y: 1}, %Offset{x: 1, y: 2}, %Offset{x: 1, y: 3}
      ]
    end

    test "returns neighbors of offset tile, orientation pointy, offset even, parity even" do
      result = Offset.new([1, 1], %{orientation: :pointy, offset: :even}) |> Offset.neighbors()

      assert result == [
        %Offset{x: 2, y: 2}, %Offset{x: 2, y: 1}, %Offset{x: 2, y: 0},
        %Offset{x: 1, y: 0}, %Offset{x: 0, y: 1}, %Offset{x: 1, y: 2}
      ]
    end
  end
end
