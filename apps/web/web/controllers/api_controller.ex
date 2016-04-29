defmodule Cheater.Web.APIController do
  use Cheater.Web.Web, :controller
  alias Cheater.Solver

  def make_dict do
    {:ok, config} = Application.fetch_env(:web, Cheater.Web.Endpoint)
    {:ok, dict} = File.read(config[:root] <> "/config/words.txt")
    dict |> String.split("\n") |> Enum.map(fn word -> to_char_list word end)
  end

  def index(conn, %{"tiles" => tiles}) do
    dict = make_dict
    suggestions = Cheater.Solver.suggest to_char_list(tiles), dict
    render conn, suggestions: Enum.map(suggestions, fn suggestion -> to_string suggestion end)
  end
end
