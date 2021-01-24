defmodule TurretWeb.UserSessionSettingsController do
  use TurretWeb, :controller

  alias Turret.Accounts

  def index(conn, _params) do
    user = conn.assigns.current_user
    session_tokens = Accounts.get_session_tokens_by_user(user)

    render(conn, "index.html", session_tokens: session_tokens)
  end

  def delete(conn, %{"session_id" => session_id}) do
    user = conn.assigns.current_user

    token = Accounts.get_session_token_by_id_and_user(user, session_id)
    Accounts.delete_session_token(token.token)

    conn
    |> put_flash(:info, "Session revoked successfully.")
    |> redirect(to: Routes.user_session_settings_path(conn, :index))
  end
end
