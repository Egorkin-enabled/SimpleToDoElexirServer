defmodule TodoServerWeb.PageController do
  use TodoServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
