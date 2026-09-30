defmodule Bob do
  def is_shouting?(input), do: String.upcase(input) == input && String.downcase(input) != input
  def is_question?(input), do: String.ends_with?(input, "?")
  def is_silent?(input), do: input == ""

  @spec hey(String.t()) :: String.t()
  def hey(input) do
    trimmed_input = String.trim(input)

    cond do
      is_silent?(trimmed_input) ->
        "Fine. Be that way!"

      is_shouting?(trimmed_input) && is_question?(trimmed_input) ->
        "Calm down, I know what I'm doing!"

      is_shouting?(trimmed_input) ->
        "Whoa, chill out!"

      is_question?(trimmed_input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
