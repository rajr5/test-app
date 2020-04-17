import Config

config :test_app, TestAppWeb.Endpoint,
  server: true,
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

use_ssl =
  case System.get_env("DB_USE_SSL") in ["true", "false"] do
    true ->
      String.to_existing_atom(System.get_env("DB_USE_SSL"))

    # by default set SSL to true
    false ->
      true
  end

config :test_app,
  db_username: System.fetch_env!("DB_USER"),
  db_password: System.fetch_env!("DB_PASSWORD"),
  db_name: System.fetch_env!("DB_NAME"),
  db_hostname: System.fetch_env!("DB_HOST"),
  db_port: String.to_integer(System.get_env("DB_PORT") || "5432"),
  db_show_sensitive_data_on_connection_error: false,
  db_pool_size: 10,
  db_use_ssl: use_ssl
