defmodule Metanoia.ProgramView do
  use Metanoia.Web, :view

  def render("index.json", %{programs: programs}) do
    %{data: render_many(programs, Metanoia.ProgramView, "program.json")}
  end

  def render("show.json", %{program: program}) do
    %{data: render_one(program, Metanoia.ProgramView, "program.json")}
  end

  def render("program.json", %{program: program}) do
    %{id: program.id,
      name: program.name}
  end
end
