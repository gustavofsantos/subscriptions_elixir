defmodule WorkspaceWeb.PageControllerTest do
  use WorkspaceWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")

    assert html_response(conn, 200) =~ "My Awesome Newsletter"
  end

  test "GET /success", %{conn: conn} do
    conn = get(conn, "/success")

    assert html_response(conn, 201) =~ "Success"
  end
end
