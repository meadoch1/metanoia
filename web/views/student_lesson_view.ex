defmodule Metanoia.StudentLessonView do
  use Metanoia.Web, :view

  def render("index.json", %{student_lessons: student_lessons}) do
    %{data: render_many(student_lessons, Metanoia.StudentLessonView, "student_lesson.json")}
  end

  def render("show.json", %{student_lesson: student_lesson}) do
    %{data: render_one(student_lesson, Metanoia.StudentLessonView, "student_lesson.json")}
  end

  def render("student_lesson.json", %{student_lesson: student_lesson}) do
    %{id: student_lesson.id,
      student_id: student_lesson.student_id,
      lesson_id: student_lesson.lesson_id,
      sent_dt: student_lesson.sent_dt,
      received_dt: student_lesson.received_dt,
      grade: student_lesson.grade}
  end
end
