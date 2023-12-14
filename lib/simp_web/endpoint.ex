defmodule SimpWeb.Endpoint do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json], json_decoder: Jason
  plug :dispatch

  defp json(%Plug.Conn{resp_headers: resp_headers} = conn, data) do
    content_type = "application/json; charset=utf-8"
    response = Jason.encode_to_iodata!(data)

    %Plug.Conn{conn | resp_headers: [{"content-type", content_type} | resp_headers]}
    |> Plug.Conn.send_resp(conn.status || 200, response)
  end

  get "/hello" do
    case Simp.Hello.world() do
      :world ->
        conn
        |> put_status(:ok)
        |> json(%{"data" => "Hello, World!"})

      _ ->
        conn
        |> send_resp(200, "")
    end
  end

  post "/upcase" do
    case conn.body_params do
      %{"data" => _} = params ->
        conn
        |> put_status(:ok)
        |> json(Simp.Hello.upcase(params))

      _ ->
        conn
        |> send_resp(422, "missing key data")
    end
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
