defmodule TurretWeb.UserSettingsController do
  use TurretWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
