defmodule Metanoia.Lesson do
  use Metanoia.Web, :model

  schema "lessons" do
    field :name, :string
    field :description, :string
    field :booklet, :boolean, default: false
    field :order_nr, :integer
    belongs_to :course, Metanoia.Course
    has_many :student_lessons, Metanoia.StudentLesson

    timestamps
  end

  @required_fields ~w(name description booklet order_nr)
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
end
