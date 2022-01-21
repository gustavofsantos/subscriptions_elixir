defmodule Workspace.NewsletterFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Workspace.Newsletter` context.
  """

  @doc """
  Generate a subscription.
  """
  def subscription_fixture(attrs \\ %{}) do
    {:ok, subscription} =
      attrs
      |> Enum.into(%{
        email: "email@email.com"
      })
      |> Workspace.Newsletter.create_subscription()

    subscription
  end
end
