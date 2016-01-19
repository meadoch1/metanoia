use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :metanoia, Metanoia.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :metanoia, Metanoia.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "chris",
  password: "Hijayne1",
  database: "metanoia_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
