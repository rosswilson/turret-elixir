defmodule TurretWeb.PageControllerTest do
  use TurretWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")

    assert html_response(conn, 200) =~ "An identity and access management service"
  end
end
