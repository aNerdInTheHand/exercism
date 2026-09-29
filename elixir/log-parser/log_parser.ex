defmodule LogParser do
  def valid_line?(line) do
    # true if starts with [DEBUG|INFO|WARNING|ERROR]
    line =~ ~r/^\[(?:DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    # split on <~|*|=|->
    String.split(line, ~r/<[=*~-]*>/)
  end

  def remove_artifacts(line) do
    # remove all "end-of-line{\d}/i"
    String.replace(line, ~r/end-of-line[\d]+/i, "")
  end

  def tag_with_user_name(line) do
    # username is non-empty string with no whitespace
    # so pattern is "User" followed by at least one
    # whitespace character and any number of non-
    # whitespace characters
    match =
      Regex.run(~r/User(\s+\S+)/, line)

    if match do
      name = String.split(to_string(match)) |> List.last()
      "[USER] #{to_string(name)} #{line}"
    else
      line
    end
  end
end
