defmodule DemoWeb.AppController do
  use Phoenix.Controller

  def index(conn, _) do
    conn
    |> put_status(:ok)
    |> json(%{"data" => "Hello, World!"})
  end
end
