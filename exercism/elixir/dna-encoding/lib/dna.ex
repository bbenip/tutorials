defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  defp do_encode([], encoded_value), do: encoded_value

  defp do_encode([nucleotide | tail], encoded_value) do
    encoded_value = <<encoded_value::bitstring, encode_nucleotide(nucleotide)::4>>
    do_encode(tail, encoded_value)
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_decode(<<>>, decoded_value), do: decoded_value

  defp do_decode(<<nucleotide::4, rest::bitstring>>, decoded_value) do
    decoded_value = [decode_nucleotide(nucleotide) | decoded_value]
    do_decode(rest, decoded_value)
  end

  def decode(dna) do
    do_decode(dna, []) |> reverse_list
  end

  defp reverse_list(list), do: reverse_list(list, [])
  defp reverse_list([], accumulator), do: accumulator
  defp reverse_list([head | tail], accumulator), do: reverse_list(tail, [head | accumulator])
end
