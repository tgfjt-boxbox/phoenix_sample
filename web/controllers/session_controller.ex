defmodule PhoenixSample.SessionController do
  use PhoenixSample.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"name" => user, "password" => pass}}) do
    case PhoenixSample.Auth.login_by_name_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome")
        |> redirect(to: page_path(conn, :index))

      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "ユーザー名/パスワードが不正です")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> PhoenixSample.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
