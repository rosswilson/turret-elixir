defmodule Turret.Repo do
  use Ecto.Repo,
    otp_app: :turret,
    adapter: Ecto.Adapters.Postgres
end
