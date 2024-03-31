defmodule EmbedsAssociations.Repo do
  use Ecto.Repo,
    otp_app: :embeds_associations,
    adapter: Ecto.Adapters.Postgres
end
