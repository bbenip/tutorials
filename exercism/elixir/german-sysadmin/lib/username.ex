defmodule Username do
  def sanitize(~c""), do: ~c""

  def sanitize([character | tail]) do
    sanitized_character =
      case character do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        x when (x >= ?a and x <= ?z or x === ?_) -> [x]
        _ -> ~c""
      end

      sanitized_character ++ sanitize(tail)
  end
end
