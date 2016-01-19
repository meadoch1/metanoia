defmodule Metanoia.MentorGroup do
  use Metanoia.Web, :model

  schema "mentor_groups" do
    field :name, :string
    belongs_to :leader, Metanoia.Leader
    belongs_to :facility, Metanoia.Facility

    timestamps
  end

  @required_fields ~w(name facility_id)
  @optional_fields ~w(leader_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def display_info(query) do
    from q in query,
    join: s in Metanoia.ScheduleEntry, on: s.mentor_group_id == q.id,
    select: %{id: q.id, name: q.name, meeting_day_of_week: s.day_of_week, meeting_week_of_month: s.week_of_month}
  end

  def next_date_of_meeting(meeting_days) do
    {start_date, _} = :calendar.local_time
    next_date_of_meeting(meeting_days, start_date)
  end

  def next_date_of_meeting(meeting_days, {start_year, start_month, start_day}) do
    {_,_,next_date} = meeting_days
                      |> Enum.sort_by( fn({day_num, week_num}) -> "#{week_num}.#{day_num}" end, &</2 )
                      |> Enum.map( fn({day_num, week_num}) -> { day_num, week_num, date_of_meeting(start_year, start_month, day_num, week_num) } end )
                      |> append_next_month(start_year, start_month)
                      |> List.flatten
                      |> Enum.find(fn({_,_,possible_date}) -> possible_date >= {start_year, start_month, start_day} end )
    next_date
  end

  def append_next_month([{day_num, week_num, date_of_meeting}|t], this_year, this_month) do
    [{day_num, week_num, date_of_meeting}| [t | [{day_num, week_num, date_of_meeting(this_year, rem(this_month, 12) + 1, day_num, week_num)}]]]
  end

  def next_date_of_meeting({this_year, this_month, this_day}, dow, [wom|t_woms]) do
    # make this compare the entire date tuple, not just date
    {_,_,this_months_date} = date_of_meeting(this_year, this_month, dow, wom)
    if this_months_date >= this_day do
      {this_year, this_month, this_months_date}
    else
      next_date_of_meeting({this_year, this_month, this_day}, dow, t_woms)
    end

  end

  def date_of_meeting(year, month, dow, wom) do
    first_of_month = {year, month, 1}
    first_dom = :calendar.day_of_the_week first_of_month
    initial_date = rem((7+dow)-first_dom, 7) + 1
    {year, month, (wom - 1) * 7 + initial_date}
  end

end
