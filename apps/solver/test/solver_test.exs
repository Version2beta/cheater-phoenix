defmodule SolverTest do
  use ExUnit.Case
  doctest Cheater.Solver

  setup do
    {:ok, pid} = Cheater.Solver.start_link
    {:ok, pid: pid}
  end

  test "match" do
    refute Cheater.Solver.matches?('a', 'abc')
    assert Cheater.Solver.matches?('abc', 'a')
  end

  test "suggest" do
    assert Cheater.Solver.suggest('abc', ['a', 'ba', 'fa', 'la']) == ['a', 'ba']
  end

  test "solve", context do
    assert Cheater.Solver.solve(context[:pid], 'abc', ['a', 'ba', 'fa', 'la']) == ['a', 'ba']
  end
end
