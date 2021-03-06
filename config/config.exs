# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :storyer,
  ecto_repos: [Storyer.Repo]

# Configures the endpoint
config :storyer, Storyer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C6MANJUObGWay7Z2yICTd3jkM+CldeqR7LWOBUBIcstUA3XhAb7lC7CpG8BIvnmF",
  render_errors: [view: Storyer.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Storyer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth, providers: [
  google: {Ueberauth.Strategy.Google, []}
]

config  :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: "364812653137-b360pu5grjgnps0caueapmus49g9urjo.apps.googleusercontent.com",
  client_secret: "tDaacmGtdkrbgnHvCgYnC15T",
  redirect_url: "http://localhost:4000"
