defmodule Metanoia.Course do
  use Metanoia.Web, :model

  schema "courses" do
    field :name, :string
    field :level, :string
    field :description, :string
    field :order_nr, :integer
    belongs_to :curriculum, Metanoia.Curriculum
    has_many :lessons, Metanoia.Lesson

    timestamps
  end

  @required_fields ~w(name level description order_nr)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def lessons_and_grades(query, student_id) do
    lesson_query = from l in Metanoia.Lesson, order_by: l.order_nr
    from q in query,
    preload: [ lessons: ^lesson_query],
    order_by: [q.curriculum_id, q.order_nr],
    select: q
  end

end
