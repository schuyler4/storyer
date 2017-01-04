defmodule Storyer.Router do
  use Storyer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Storyer.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Storyer do
    pipe_through :browser # Use the default browser stack

    get "/", StoryController, :index
    get "/storys/new/", StoryController, :new
    post "/storys/", StoryController, :create
    get "/storys/:id/", StoryController, :show
    get "/storys/:id/edit/", StoryController, :edit
    put "storys/:id/", StoryController, :update
    put "storys/:id/delete", StoryController, :set_inactive
  end

  scope "/auth", Storyer do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Storyer do
  #   pipe_through :api
  # end
end
