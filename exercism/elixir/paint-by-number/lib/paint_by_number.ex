defmodule PaintByNumber do
  defp palette_bit_size(color_count, size) do
    if Integer.pow(2, size) >= color_count do
      size
    else
      palette_bit_size(color_count, size + 1)
    end
  end

  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 1)
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    pixel_size = palette_bit_size(color_count)
    <<pixel_color_index::size(pixel_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    pixel_size = palette_bit_size(color_count)
    <<first_pixel::size(pixel_size), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    pixel_size = palette_bit_size(color_count)
    <<_first_pixel::size(pixel_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
