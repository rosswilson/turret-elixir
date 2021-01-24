defmodule TurretWeb.UserSessionSettingsController do
  use TurretWeb, :controller

  alias Turret.Accounts

  def index(conn, _params) do
    user = conn.assigns.current_user
    session_tokens = Accounts.get_session_tokens_by_user(user)

    render(conn, "index.html", session_tokens: session_tokens)
  end
end
