defmodule Cheater.Solver.Supervisor do
  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    start_solver_supervisor
  end

  def start_solver_supervisor do
    children = [worker(Cheater.Solver, [])]
    Supervisor.start_link(children, strategy: :simple_one_for_one, name: Cheater.SolverSupervisor)
    start_solver(key: :solver)
  end

  def start_solver(key: key) when is_binary(key), do: raise "Please use an atom key"
  def start_solver(key: key) when is_atom(key) do
    res = Supervisor.start_child(Cheater.SolverSupervisor, [%{key: key}])
  end
end
