use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter_web, ChatterWeb.Endpoint,
  http: [port: 4001],
  server: false
