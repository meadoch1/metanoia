defmodule Metanoia.ScheduleEntry do
  use Metanoia.Web, :model

  schema "schedule_entries" do
    field :day_of_week, :integer
    field :week_of_month, :integer
    belongs_to :mentor_group, Metanoia.MentorGroup

    timestamps
  end

  @required_fields ~w(day_of_week week_of_month)
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

  def for_group(query, mentor_group_id) do
    from q in query,
    where: q.mentor_group_id == ^mentor_group_id,
    order_by: [q.week_of_month, q.day_of_week],
    select: q
  end

  def day_name(day_of_week) do
    case day_of_week do
      0 -> "Sunday"
      1 -> "Monday"
      2 -> "Tuesday"
      3 -> "Wednesday"
      4 -> "Thursday"
      5 -> "Friday"
      6 -> "Saturday"
      _ -> "Unknown"
    end
  end
end
