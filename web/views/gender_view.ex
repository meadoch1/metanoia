defmodule Metanoia.GenderView do
  use Metanoia.Web, :view

  def render("index.json", %{genders: genders}) do
    %{data: render_many(genders, Metanoia.GenderView, "gender.json")}
  end

  def render("show.json", %{gender: gender}) do
    %{data: render_one(gender, Metanoia.GenderView, "gender.json")}
  end

  def render("gender.json", %{gender: gender}) do
    %{id: gender.id,
      name: gender.name,
      code: gender.code}
  end
end
