defmodule TwixWeb.Router do
  use TwixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: TwixWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      socket: TwixWeb.TwixSocket,
      schema: TwixWeb.Schema
  end

  scope "/api", TwixWeb do
    pipe_through :api

    get "/users", UsersController, :index
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:twix, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TwixWeb.Telemetry
    end
  end
end
