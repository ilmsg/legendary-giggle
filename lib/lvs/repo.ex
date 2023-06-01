defmodule Lvs.Repo do
  use Ecto.Repo,
    otp_app: :lvs,
    adapter: Ecto.Adapters.Postgres
end
