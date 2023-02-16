defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end
  def remaining_minutes_in_oven(minutes_elapsed) do
    expected_minutes_in_oven() - minutes_elapsed
  end
  def preparation_time_in_minutes(layers) do
    layers * 2
  end
  def total_time_in_minutes(layers, minutes_elapsed) do
    preparation_time_in_minutes(layers) + minutes_elapsed
  end
  def alarm do
    "Ding!"
  end
end
