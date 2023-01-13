import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :cocktail_index, CocktailIndex.Repo,
  username: "root",
  password: "password",
  hostname: "127.0.0.1",
  database: "cocktail_index_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cocktail_index, CocktailIndexWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "pMnKc6BISWgo/o1c6YF5rMe67niKquEjIL/vkluHsBHXv7V1SbhWpYPGS/2g5KA5",
  server: true

# In test we don't send emails.
config :cocktail_index, CocktailIndex.Mailer, adapter: Swoosh.Adapters.Test

# In test, use Ecto sandbox.
config :cocktail_index, :sandbox, Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Set up wallaby
config :wallaby, driver: Wallaby.Chrome
config :wallaby, otp_app: :cocktail_index
