defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # a: 97 z: 122
    username
    # flat_map returns new enumerable, similar to
    # map + concat, so can return lists for each case
    |> Enum.flat_map(fn char ->
      case char do
        # find substitutions via charlist sigil,
        # return new charlist
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        # allow a-z and _, just return initial charlist
        c when (c >= ?a and c <= ?z) or c == ?_ -> [c]
        # strip any other value
        _ -> []
      end
    end)
  end
end
