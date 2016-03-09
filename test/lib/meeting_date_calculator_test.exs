defmodule Metanoia.MeetingDateCalculatorTest do
  use Metanoia.ModelCase

  alias Metanoia.MeetingDateCalculator

  test "next_date_of_meeting when meeting day doesn't occur in the first week of the month" do
    meeting_days = [ {1,1}, {1,3}]
    start_dt = {2016,3,8}

    assert MeetingDateCalculator.next_date_of_meeting(meeting_days, start_dt) == {2016,3,21}
  end

  test "next_date_of_meeting when meeting day does occur in the first week of the month" do
    meeting_days = [ {4,1}, {4,3}]
    start_dt = {2016,3,8}

    assert MeetingDateCalculator.next_date_of_meeting(meeting_days, start_dt) == {2016,3,17}
  end

  test "next_date_of_meeting when the next date is in the current week" do
    meeting_days = [ {4,2}, {4,4}]
    start_dt = {2016,3,8}

    assert MeetingDateCalculator.next_date_of_meeting(meeting_days, start_dt) == {2016,3,10}
  end

  test "prior_date_of_meeting when the prior date is in the current week" do
    meeting_days = [ {4,2}, {4,4}]
    start_dt = {2016,3,12}

    assert MeetingDateCalculator.prior_date_of_meeting(meeting_days, start_dt) == {2016,3,10}
  end

  test "prior_date_of_meeting when the prior date is in the previous week" do
    meeting_days = [ {3,1}, {3,3}]
    start_dt = {2016,3,8}

    assert MeetingDateCalculator.prior_date_of_meeting(meeting_days, start_dt) == {2016,3,2}
  end
  test "prior_date_of_meeting when the prior date is in the previous month" do
    meeting_days = [ {1,1}, {1,3}]
    start_dt = {2016,3,6}

    assert MeetingDateCalculator.prior_date_of_meeting(meeting_days, start_dt) == {2016,2,15}
  end
end
