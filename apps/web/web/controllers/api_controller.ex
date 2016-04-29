defmodule Cheater.Web.APIController do
  use Cheater.Web.Web, :controller
  alias Cheater.Solver

  def index(conn, %{"tiles" => tiles}) do
    {:ok, pid} = Cheater.Solver.Supervisor.start_solver
    dict = ['a', 'ba', 'fa', 'la']
    suggestions = Cheater.Solver.solve pid, to_char_list(tiles), dict
    render conn, suggestions: Enum.map(suggestions, fn suggestion -> to_string suggestion end)
  end
end
