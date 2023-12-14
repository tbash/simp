import Config

config :simp, port: 4000

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :logger, :console, format: "[$level] $message\n"
