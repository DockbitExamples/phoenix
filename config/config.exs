# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dockbit_phoenix_example,
  ecto_repos: [DockbitPhoenixExample.Repo]

# Configures the endpoint
config :dockbit_phoenix_example, DockbitPhoenixExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OqwU/DeFqpYHNvElXvv9ywacq8keORV3rxXo+MbZWLxbDK2eir/WLnsluTv6u8TN",
  render_errors: [view: DockbitPhoenixExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DockbitPhoenixExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
