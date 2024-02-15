defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    number = Enum.random(1_000..9_999)
    "NCC-#{number}"
  end

  def random_stardate() do
    :rand.uniform() * 1_000 + 41_000
  end

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate])
    |> to_string()
  end
end
