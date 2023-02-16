defmodule KitchenCalculator do
  @conversions_from_ml %{
    :milliliter => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }

  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {
      :milliliter,
      get_volume(volume_pair) * @conversions_from_ml[elem(volume_pair, 0)]
    }
  end

  def from_milliliter(volume_pair, unit) do
    amount = get_volume(volume_pair) / @conversions_from_ml[unit]
    {
      unit,
      amount
    }
  end

  def convert(volume_pair, unit) do to_milliliter(volume_pair) |> from_milliliter(unit) end
end
