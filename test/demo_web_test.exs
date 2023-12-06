defmodule DemoWeb.ApplicationControllerTest do
  use ExUnit.Case

  import Plug.Conn
  import Phoenix.ConnTest

  alias DemoWeb.Router.Helpers, as: Routes

  # The default endpoint for testing
  @endpoint DemoWeb.Endpoint

  setup do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  describe "GET /" do
    test "renders the app index", %{conn: conn} do
      conn = get(conn, Routes.app_path(conn, :index))

      assert %{"data" => "Hello, World!"} = json_response(conn, 200)
    end
  end
end
