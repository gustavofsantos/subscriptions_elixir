defmodule Workspace.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :email, :string

      timestamps()
    end

    create unique_index(:subscriptions, [:email])
  end
end
