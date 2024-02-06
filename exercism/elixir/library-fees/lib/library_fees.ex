defmodule LibraryFees do
  def datetime_from_string(string), do: string |> NaiveDateTime.from_iso8601!()

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    days_till_return = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime |> NaiveDateTime.to_date() |> Date.add(days_till_return)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime |> NaiveDateTime.to_date() |> Date.diff(planned_return_date) |> max(0)
  end

  def monday?(datetime) do
    monday = 1

    datetime |> NaiveDateTime.to_date() |> Date.day_of_week() |> Kernel.===(monday)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = checkout |> datetime_from_string()
    return_datetime = return |> datetime_from_string()

    raw_late_fee = checkout_datetime |> return_date |> days_late(return_datetime) |> Kernel.*(rate)

    if monday?(return_datetime), do: div(raw_late_fee, 2), else: raw_late_fee
  end
end
