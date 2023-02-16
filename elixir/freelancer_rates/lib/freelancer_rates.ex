import Float
import Kernel
defmodule FreelancerRates do
  @billable_hours_in_day 8
  @billable_days_in_month 22
  defp discount_value(cost, discount_rate) do
    cost * (discount_rate / 100)
  end
  defp monthly_cost(hourly_rate) do
    hourly_rate * @billable_hours_in_day * @billable_days_in_month
  end
  def daily_rate(hourly_rate) do
    hourly_rate * @billable_hours_in_day / 1
  end
  def apply_discount(before_discount, discount) do
    before_discount - discount_value(before_discount, discount)
  end
  def monthly_rate(hourly_rate, discount) do
    total_price = monthly_cost(hourly_rate)
    Kernel.ceil(total_price - discount_value(total_price, discount))
  end
  def days_in_budget(budget, hourly_rate, discount) do
    discounted_hourly_rate = apply_discount(hourly_rate, discount)
    budget / (discounted_hourly_rate * @billable_hours_in_day) |> floor(1)
  end
end
