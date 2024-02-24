defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc) do
    function_name =
      case ast do
        {:def, _, [{:when, _, [{name, _, args}, _]}, _]} when is_list(args) ->
          String.slice(to_string(name), 0, length(args))
        {:defp, _, [{:when, _, [{name, _, args}, _]}, _]} when is_list(args) ->
          String.slice(to_string(name), 0, length(args))
        {:def, _, [{name, _, args} | _]} when is_list(args) ->
          String.slice(to_string(name), 0, length(args))
        {:defp, _, [{name, _, args} | _]} when is_list(args) ->
          String.slice(to_string(name), 0, length(args))
        {:def, _, _} ->
          ""
        {:defp, _, _} ->
          ""
        _ ->
          nil
      end

    case function_name do
      nil -> {ast, acc}
      _ -> {ast, [function_name | acc]}
    end
  end

  def decode_secret_message(string) do
    ast = to_ast(string)

    {_, acc} = Macro.prewalk(ast, [], &decode_secret_message_part/2)

    acc |> Enum.reverse() |> Enum.join()
  end
end
