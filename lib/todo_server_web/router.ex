defmodule TodoServerWeb.Router do
  use TodoServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", TodoServerWeb.API do
    pipe_through :api

    post "/todo", Controller, :edit
    delete "/todo", Controller, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      live_dashboard "/dashboard", metrics: TodoServerWeb.Telemetry
    end
  end
end
