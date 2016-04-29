defmodule Cheater.Solver.Supervisor do
  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    start_solver_supervisor
  end

  def start_solver_supervisor do
    children = [worker(Cheater.Solver, [], restart: :temporary)]
    Supervisor.start_link(children, strategy: :simple_one_for_one, name: Cheater.SolverSupervisor)
  end

  def start_solver, do: Supervisor.start_child(Cheater.SolverSupervisor, [])
end
