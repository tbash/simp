defmodule DemoWeb.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html", "json"]
  end

  scope "/", DemoWeb do
    pipe_through :browser

    get "/", AppController, :index

    # Prevent a horrible error because ErrorView is missing
    get "/favicon.ico", AppController, :index
  end
end
