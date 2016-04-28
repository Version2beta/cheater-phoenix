defmodule Cheater.Web.PageController do
  use Cheater.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
