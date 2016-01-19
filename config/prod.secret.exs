use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :metanoia, Metanoia.Endpoint,
  secret_key_base: "pFiQxkpw/AmJcNdyrdCL99VWFgZfXnZ0+2reFanS6g75oCfkKPwS6hbMr8rfOBoB"

# Configure your database
config :metanoia, Metanoia.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "metanoia_prod",
  pool_size: 20
