defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path, ".")
    # reduce data to each level of path, return value of end of path
    |> Enum.reduce(data, fn subpath, acc -> acc[subpath] end)
  end

  def get_in_path(data, path), do: get_in(data, String.split(path, "."))
end
