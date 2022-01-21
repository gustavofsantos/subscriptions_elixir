defmodule Workspace.Repo do
  use Ecto.Repo,
    otp_app: :workspace,
    adapter: Ecto.Adapters.Postgres
end
