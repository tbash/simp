defmodule DemoWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Plug.Conn

  @opts DemoWeb.Endpoint.init([])

  test "GET /hello returns expected data" do
    conn =
      conn(:get, "/hello")
      |> DemoWeb.Endpoint.call(@opts)

    assert %{"data" => "Hello, World!"} = json_response(conn, 200)
  end

  test "POST /upcase returns expected data" do
    conn =
      conn(:post, "/upcase", %{data: "abcD"})
      |> DemoWeb.Endpoint.call(@opts)

    assert %{data: "ABCD"} = json_response(conn, 200)
  end

  test "it returns 404 when no route matches" do
    conn =
      conn(:get, "/not-found")
      |> DemoWeb.Endpoint.call(@opts)

    assert conn.status == 404
  end

  defp json_response(conn, status) do
    case {conn.status, Conn.get_resp_header(conn, "content-type")} |> IO.inspect() do
      {^status, ["application/json" <> _]} ->
        Jason.decode!(conn.resp_body)

      _ ->
        :bad_test_response
    end
  end
end
