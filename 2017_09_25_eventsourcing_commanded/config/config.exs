# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.Extreme

config :extreme, :event_store,
  db_type: :node,
  host: "event-store",
  port: 1113,
  username: "admin",
  password: "changeit",
  reconnect_delay: 2_000,
  max_attempts: :infinity

config :commanded_extreme_adapter,
  serializer: Commanded.Serialization.JsonSerializer,
  stream_prefix: "account"
