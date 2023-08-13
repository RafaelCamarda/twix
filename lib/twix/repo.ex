defmodule Twix.Repo do
  use Ecto.Repo,
    otp_app: :twix,
    adapter: Ecto.Adapters.Postgres
end
