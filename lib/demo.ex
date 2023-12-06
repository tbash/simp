defmodule Demo do
  @moduledoc """
  Application for `Demo`.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: DemoWeb.Endpoint,
        options: [port: Application.get_env(:demo, :port)]
      )
    ]

    opts = [strategy: :one_for_one, name: Demo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
