defmodule TurretWeb.UserPasswordSettingsController do
  use TurretWeb, :controller

  alias Turret.Accounts
  alias TurretWeb.UserAuth

  plug :assign_changeset

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def update(conn, %{"current_password" => password, "user" => user_params}) do
    user = conn.assigns.current_user

    case Accounts.update_user_password(user, password, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Password updated successfully.")
        |> put_session(:user_return_to, Routes.user_settings_path(conn, :index))
        |> UserAuth.log_in_user(user)

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  defp assign_changeset(conn, _opts) do
    user = conn.assigns.current_user

    conn
    |> assign(:changeset, Accounts.change_user_password(user))
  end
end
