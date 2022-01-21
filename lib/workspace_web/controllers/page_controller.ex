defmodule WorkspaceWeb.PageController do
  use WorkspaceWeb, :controller

  alias Workspace.Newsletter
  alias Workspace.Newsletter.Subscription

  def index(conn, _params) do
    changeset = Subscription.changeset(%Subscription{})

    conn |> render("index.html", changeset: changeset)
  end

  def success(conn, _params) do
    conn
    |> put_status(201)
    |> render("success.html")
  end

  def subscribe(conn, params) do
    email = Map.get(params, "subscription") |> Map.get("email")

    case Newsletter.create_subscription(%{ email: email }) do
      {:ok, _subscription } ->
        redirect(conn, to: "/success")
      {:error, changeset } ->
        render(conn, "index.html", changeset: changeset)
    end
  end
end
