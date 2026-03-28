defmodule TodoServerWeb.API.Controller do
  use TodoServerWeb, :controller

  def _construct_response(
    conn, items, action = %{ "type" => _, "argument" => _}) do
    conn
    |> put_resp_content_type("application/json")
    |> put_status(:ok)
    |> json(%{
      "status" => :ok, "items" => items, "action" => action})
  end

  def _construct_response(conn, items, nil) do
    conn
    |> put_resp_content_type("application/json")
    |> put_status(:conflict)
    |> json(
      %{
        "status" => :conflict,
        "items" => items, "action" => nil})
  end

  def _construct_response_selected(conn, item, action, true) do
    _construct_response(conn, item, action)
  end

  def _construct_response_selected(conn, item, _, false) do
    _construct_response(conn, item, nil)
  end

  def edit(conn, %{"items" => items, "target" => target}) do
    _construct_response_selected(
      conn,
      items,
      %{ "type" => "add", "argument" => target },
      target not in items
    )
  end

  def delete(conn, %{"items" => items, "target" => target}) do
    index = Enum.find_index(items, fn x -> x == target end)
    _construct_response_selected(
      conn,
      items,
      %{ "type" => "remove", "argument" => index },
      !is_nil(index)
    )
  end
end
