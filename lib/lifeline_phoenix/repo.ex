defmodule LifelinePhoenix.Repo do
  use Ecto.Repo,
    otp_app: :lifeline_phoenix,
    adapter: Ecto.Adapters.Postgres
end
