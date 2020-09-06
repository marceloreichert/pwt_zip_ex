# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pwt_zip,
  ecto_repos: [PwtZip.Repo]

# Configures the endpoint
config :pwt_zip, PwtZipWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t8v7zhOswaVrvCDsfH0uaaFLJByfTcQba5+lte1i0gpFgvKtpevkMSnd+y3j2I3k",
  render_errors: [view: PwtZipWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PwtZip.PubSub,
  live_view: [signing_salt: "mDJbL/bR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
