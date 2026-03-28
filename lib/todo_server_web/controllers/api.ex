defmodule TodoServerWeb.API.Controller do
  use TodoServerWeb, :controller

  defmacro _items_match(items) do
    is_list(items)
  end

  def edit(conn, %{"items" => items, "target" => target}) when is_list(items) do
     if target in items do
       conn
       |> put_resp_content_type("application/json")
       |> put_status(:conflict) # Conflict
       |> json(%{ "status" => :conflict, "items" => items, "action" => nil})
      else
        conn
        |> put_resp_content_type("application/json")
        |> put_status(:ok)
        |> json(%{ "status" => :ok, "items" => items, "action" => %{ "type" => "add", "argument" => target }})
    end
  end

  def delete(conn, %{"items" => items, "target" => target}) when is_list(items) do
    if target in items do
      conn
      |> put_resp_content_type("application/json")
      |> put_status(:ok)
      |> json(%{ "status" => :ok, "items" => items, "action" => %{ "type" => "remove", "argument" => Enum.find_index(items, fn x -> x == target end) }})
    else
      conn
      |> put_resp_content_type("application/json")
      |> put_status(:conflict) # Conflict
      |> json(%{ "status" => :conflict, "items" => items, "action" => nil})
    end
  end
end
