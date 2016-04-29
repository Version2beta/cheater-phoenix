defmodule Cheater.Solver do
  use GenServer

  def start_link() do
    {:ok, pid} = GenServer.start_link(__MODULE__, [])
    {:ok, pid}
  end

  # Public API
  def solve(pid, tiles, dict) do
    GenServer.call(pid, {:solve, {tiles, dict}})
  end

  # Internal GenServer bits
  def handle_call({:solve, {tiles, dict}}, _sender, _state) do
    {:reply, suggest(tiles, dict), []}
  end

  # Business logic

  def matches?(tiles, word) do
    MapSet.new(word) == MapSet.intersection(MapSet.new(tiles), MapSet.new(word))
  end

  def suggest(tiles, dict) do
    Enum.filter(dict, fn(word) -> matches?(tiles, word) end)
  end

end
