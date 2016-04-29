defmodule Cheater.Web.Router do
  use Cheater.Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Cheater.Web do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/api", Cheater.Web do
    pipe_through :api
    get "/:tiles", APIController, :index
  end
end
