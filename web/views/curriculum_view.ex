defmodule Metanoia.CurriculumView do
  use Metanoia.Web, :view

  def render("index.json", %{curriculums: curriculums}) do
    %{data: render_many(curriculums, Metanoia.CurriculumView, "curriculum.json")}
  end

  def render("show.json", %{curriculum: curriculum}) do
    %{data: render_one(curriculum, Metanoia.CurriculumView, "curriculum.json")}
  end

  def render("curriculum.json", %{curriculum: curriculum}) do
    %{id: curriculum.id,
      name: curriculum.name,
      description: curriculum.description}
  end
end
