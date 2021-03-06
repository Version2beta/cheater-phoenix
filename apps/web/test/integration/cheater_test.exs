defmodule CheaterIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Cheater.Web.Router

  @opts Router.init([])
  test "API responds" do
    conn = conn(:get, "/api/abc")
    response = Router.call(conn, @opts)
    assert response.status == 200
  end

  @opts Router.init([])
  test "API gives reasonable answers" do
    conn = conn(:get, "/api/abc")
    response = Router.call(conn, @opts)
    assert response.resp_body == "[\"ab\",\"ba\",\"cab\",\"\"]"
  end
end
