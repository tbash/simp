defmodule DemoWeb.AppController do
  use Phoenix.Controller

  def index(conn, _) do
    body = Jason.encode!(%{"data" => "Hello, World!"})

    send_resp(conn, 200, body)
  end
end
