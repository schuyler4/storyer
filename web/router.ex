defmodule Storyer.Router do
  use Storyer.Web, :router

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

  scope "/", Storyer do
    pipe_through :browser # Use the default browser stack

    get "/", StoryController, :index
    get "/storys/new", StoryController, :new
    post "/storys", StoryController, :create
    get "/storys/:id", StoryController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Storyer do
  #   pipe_through :api
  # end
end
