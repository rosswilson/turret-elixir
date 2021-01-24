# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :turret,
  ecto_repos: [Turret.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :turret, TurretWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J9BEd7+H0pxgOl1r8K9AQ50KKNRaUhU5oJb+9ASMYjrM5+2tCswPDlJuhM5puwPC",
  render_errors: [view: TurretWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Turret.PubSub,
  live_view: [signing_salt: "lwDKZp1Q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
