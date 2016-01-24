defmodule Metanoia.PastorView do
  use Metanoia.Web, :view

  def render("index.json", %{pastors: pastors}) do
    %{data: render_many(pastors, Metanoia.PastorView, "pastor.json")}
  end

  def render("show.json", %{pastor: pastor}) do
    %{data: render_one(pastor, Metanoia.PastorView, "pastor.json")}
  end

  def render("pastor.json", %{pastor: pastor}) do
    %{id: pastor.id,
      person_id: pastor.person_id,
      is_primary: pastor.is_primary,
      is_head: pastor.is_head}
  end
end
