defmodule TurretWeb.UserSessionSettingsControllerTest do
  use TurretWeb.ConnCase, async: true

  alias Turret.Accounts

  setup :register_and_log_in_user

  describe "GET /users/settings/sessions" do
    test "renders sessions settings page", %{conn: conn} do
      conn = get(conn, Routes.user_session_settings_path(conn, :index))
      response = html_response(conn, 200)
      assert response =~ "<h1>Sessions</h1>"
    end

    test "renders list of session tokens", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_session_settings_path(conn, :index))
      response = html_response(conn, 200)

      session_tokens = Accounts.get_session_tokens_by_user(user)

      Enum.each(session_tokens, fn session_token -> assert response =~ session_token.id end)
    end

    test "redirects if user is not logged in" do
      conn = build_conn()
      conn = get(conn, Routes.user_session_settings_path(conn, :index))
      assert redirected_to(conn) == Routes.user_session_path(conn, :new)
    end
  end
end
