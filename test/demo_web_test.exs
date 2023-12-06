defmodule DemoWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Plug.Conn

  @opts DemoWeb.Endpoint.init([])

  describe "GET /" do
    test "renders the app index" do
      conn =
        conn(:get, "/hello")
        |> DemoWeb.Endpoint.call(@opts)

      assert %{"data" => "Hello, World!"} = json_response(conn, 200)
    end
  end

  defp json_response(conn, status) do
    case {conn.status, Conn.get_resp_header(conn, "content-type")} do
      {^status, ["application/json" <> _]} ->
        Jason.decode!(conn.resp_body)

      _ ->
        :bad_response
    end
  end
end
