defmodule Metanoia.CourseView do
  use Metanoia.Web, :view

  def render("index.json", %{courses: courses}) do
    %{data: render_many(courses, Metanoia.CourseView, "course.json")}
  end

  def render("show.json", %{course: course}) do
    %{data: render_one(course, Metanoia.CourseView, "course.json")}
  end

  def render("course.json", %{course: course}) do
    %{id: course.id,
      name: course.name,
      level: course.level,
      description: course.description,
      order_nr: course.order_nr,
      curriculum_id: course.curriculum_id}
  end
end
