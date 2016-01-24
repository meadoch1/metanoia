defmodule Metanoia.LessonView do
  use Metanoia.Web, :view

  def render("index.json", %{lessons: lessons}) do
    %{data: render_many(lessons, Metanoia.LessonView, "lesson.json")}
  end

  def render("show.json", %{lesson: lesson}) do
    %{data: render_one(lesson, Metanoia.LessonView, "lesson.json")}
  end

  def render("lesson.json", %{lesson: lesson}) do
    %{id: lesson.id,
      name: lesson.name,
      description: lesson.description,
      booklet: lesson.booklet,
      order_nr: lesson.order_nr,
      course_id: lesson.course_id}
  end
end
