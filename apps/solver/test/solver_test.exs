defmodule SolverTest do
  use ExUnit.Case
  doctest Cheater.Solver

  test "match" do
    refute Cheater.Solver.pick('a', 'abc') == 'abc'
    assert Cheater.Solver.pick('abc', 'a') == 'a'
  end

  test "suggest" do
    assert Cheater.Solver.suggest('abc', ['a', 'ba', 'fa', 'la']) == ['a', 'ba']
  end
end
