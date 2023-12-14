defmodule Simp do
  @moduledoc """
  Application for `Simp`.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: SimpWeb.Endpoint,
        options: [port: Application.get_env(:simp, :port)]
      )
    ]

    opts = [strategy: :one_for_one, name: Simp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
