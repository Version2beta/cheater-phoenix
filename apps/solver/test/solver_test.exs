defmodule SolverTest do
  use ExUnit.Case
  doctest Cheater.Solver

  setup do
    {:ok, solver} = Cheater.Solver.start_link %{key: :test}
    :ok
  end

  test "match" do
    refute Cheater.Solver.matches?('a', 'abc')
    assert Cheater.Solver.matches?('abc', 'a')
  end

  test "suggest" do
    assert Cheater.Solver.suggest('abc', ['a', 'ba', 'fa', 'la']) == ['a', 'ba']
  end

  test "solve" do
    assert Cheater.Solver.solve(:test, 'abc', ['a', 'ba', 'fa', 'la']) == ['a', 'ba']
  end
end
