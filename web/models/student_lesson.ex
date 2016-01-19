defmodule Metanoia.StudentLesson do
  use Metanoia.Web, :model

  schema "student_lessons" do
    field :sent_dt, Ecto.Date
    field :received_dt, Ecto.Date
    field :grade, :float
    belongs_to :student, Metanoia.Student
    belongs_to :lesson, Metanoia.Lesson

    timestamps
  end

  @required_fields ~w(lesson_id student_id  )
  @optional_fields ~w(sent_dt grade received_dt)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
