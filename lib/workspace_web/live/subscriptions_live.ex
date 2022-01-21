defmodule WorkspaceWeb.SubscriptionsLive do
  use WorkspaceWeb, :live_view

  @topic "subscriptions"

  alias Workspace.Newsletter

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Newsletter.subscribe()
    end

    subscriptions = Newsletter.list_subscriptions()
    socket = assign(socket, :subscriptions, subscriptions)

    {:ok, socket}
  end


  def handle_info({:subscription_created, subscription}, socket) do
    socket = update(socket, :subscriptions, fn subscriptions ->
      [subscription | subscriptions]
    end)

    {:noreply, socket}
  end
end
