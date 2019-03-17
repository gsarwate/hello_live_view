# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_live_view,
  ecto_repos: [HelloLiveView.Repo]

# Configures the endpoint
config :hello_live_view, HelloLiveViewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J4zndeWAbv+NmtUeYvd2cZaOHJCLq2ZmHDUEEAlUJcu1k07j+RBO3z8rtTGu1Hz4",
  render_errors: [view: HelloLiveViewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloLiveView.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "08t110MH4wqrzfGNZ65uCwgMpIXBVhsp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
