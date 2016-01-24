defmodule Metanoia.UserView do
  use Metanoia.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Metanoia.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Metanoia.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      encrypted_password: user.encrypted_password,
      admin: user.admin,
      person_id: user.person_id}
  end
end
