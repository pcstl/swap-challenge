defmodule ExploringMarsTest do
  @moduledoc """
  Top-level (integration) tests.

  The two first tests are simply the test cases given initially.

  Further tests check for further cases. For instance, if the probe is 
  instructed to go over the plateau's edge, it will fall off and the position
  where it fell will be returned.
  """
  
  use ExUnit.Case
  doctest ExploringMars

  test "Example Case 1" do
    assert ExploringMars.explore(
      {5, 5},
      {{1, 2}, :N},
      [:L, :M, :L, :M, :L, :M, :L, :M, :M]
    ) == {:ok, {1, 3, :N}}
  end

  test "Example Case 2" do
    assert ExploringMars.explore(
      {5, 5},
      {{3, 3}, :E},
      [:M, :M, :R, :M, :M, :R, :M, :R, :R, :M]
    ) == {:ok, {5, 1, :E}}
  end

  test "Falls off the edge" do
    assert ExploringMars.explore(
      {2, 2},
      {{0, 0}, :N},
      [:M, :M, :M]
    ) == {:out_of_bounds, {{0, 3}, :N}}
  end

  test "Does not move after falling off" do
    assert ExploringMars.explore(
      {2, 2},
      {{0, 0}, :N},
      [:M, :M, :M, :M]
    ) == {:out_of_bounds, {{0, 3}, :N}}
  end
end
