defmodule Workspace.NewsletterTest do
  use Workspace.DataCase

  alias Workspace.Newsletter

  describe "subscriptions" do
    alias Workspace.Newsletter.Subscription

    import Workspace.NewsletterFixtures

    @invalid_attrs %{email: nil}

    test "list_subscriptions/0 returns all subscriptions" do
      subscription = subscription_fixture()
      assert Newsletter.list_subscriptions() == [subscription]
    end

    test "get_subscription!/1 returns the subscription with given id" do
      subscription = subscription_fixture()
      assert Newsletter.get_subscription!(subscription.id) == subscription
    end

    test "create_subscription/1 with valid data creates a subscription" do
      valid_attrs = %{email: "email@email.com"}

      assert {:ok, %Subscription{} = subscription} = Newsletter.create_subscription(valid_attrs)
      assert subscription.email == "email@email.com"
    end

    test "create_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletter.create_subscription(@invalid_attrs)
    end

    test "update_subscription/2 with valid data updates the subscription" do
      subscription = subscription_fixture()
      update_attrs = %{email: "new-emailW@email.com"}

      assert {:ok, %Subscription{} = subscription} = Newsletter.update_subscription(subscription, update_attrs)
      assert subscription.email == "new-emailW@email.com"
    end

    test "update_subscription/2 with invalid data returns error changeset" do
      subscription = subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Newsletter.update_subscription(subscription, @invalid_attrs)
      assert subscription == Newsletter.get_subscription!(subscription.id)
    end

    test "delete_subscription/1 deletes the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{}} = Newsletter.delete_subscription(subscription)
      assert_raise Ecto.NoResultsError, fn -> Newsletter.get_subscription!(subscription.id) end
    end

    test "change_subscription/1 returns a subscription changeset" do
      subscription = subscription_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_subscription(subscription)
    end
  end
end
