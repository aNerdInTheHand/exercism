defmodule BinarySearch do
  @doc """
    Searches for a target_value in the tuple using the binary search algorithm.
    It returns :not_found if the target_value is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _target_value), do: :not_found

  def search(numbers, target_value) do
    search(numbers, target_value, 0, tuple_size(numbers) - 1)
  end

  defp search(_numbers, _target_value, low, high) when low > high, do: :not_found

  defp search(numbers, target_value, low, high) do
    mid_index = div(low + high, 2)
    mid_value = elem(numbers, mid_index)

    cond do
      mid_value == target_value -> {:ok, mid_index}
      # middle value higher than target value, search lower half of list
      mid_value > target_value -> search(numbers, target_value, low, mid_index - 1)
      # middle value lower than target value, search higher half of list
      true -> search(numbers, target_value, mid_index + 1, high)
    end
  end
end
