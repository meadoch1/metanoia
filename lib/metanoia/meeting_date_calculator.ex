defmodule Metanoia.MeetingDateCalculator do
  def next_date_of_meeting(meeting_days) do
    {start_date, _} = :calendar.local_time
    next_date_of_meeting(meeting_days, start_date)
  end

  def next_date_of_meeting(meeting_days, start_date) do
    closest_date_of_meeting(meeting_days, start_date, &</2, &next_month_num/1, &>=/2)
  end

  def prior_date_of_meeting(meeting_days) do
    {start_date, _} = :calendar.local_time
    prior_date_of_meeting(meeting_days, start_date)
  end

  def prior_date_of_meeting(meeting_days, start_date) do
    closest_date_of_meeting(meeting_days, start_date, &>/2, &prior_month_num/1, &</2)
  end

  defp closest_date_of_meeting(meeting_days, {start_year, start_month, start_day}, sort_func, shift_func, find_func) do
    {_,_,closest_date} = meeting_days
    |> Enum.sort_by( fn({day_num, week_num}) -> "#{week_num}.#{day_num}" end, sort_func )
    |> Enum.map( fn({day_num, week_num}) -> { day_num, week_num, date_of_meeting(start_year, start_month, day_num, week_num) } end )
    |> append_shifted_month(start_year, start_month, shift_func)
    |> List.flatten
    |> Enum.find(fn({_,_,possible_date}) -> find_func.(possible_date, {start_year, start_month, start_day}) end )
    closest_date
  end

  defp prior_month_num(1) do
    12
  end
  defp prior_month_num(n) do
    n-1
  end

  defp next_month_num(12) do
    1
  end
  defp next_month_num(n) do
    n+1
  end

  defp append_shifted_month([{day_num, week_num, date_of_meeting}|t], this_year, this_month, shift_func) do
    [{day_num, week_num, date_of_meeting}| [t | [{day_num, week_num, date_of_meeting(this_year, shift_func.(this_month), day_num, week_num)}]]]
  end

  defp date_of_meeting(year, month, dow, wom) do
    first_of_month = {year, month, 1}
    first_dom = :calendar.day_of_the_week first_of_month
    initial_date = rem((7+dow)-first_dom, 7) + 1
    {year, month, (wom - 1) * 7 + initial_date}
  end
end
