defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory |> Enum.sort_by(&(&1.price))
  end

  def with_missing_price(inventory) do
    inventory |> Enum.filter(&(&1.price === nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(
      fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end
    )
  end

  def increase_quantity(item, count) do
    quantity_by_size = Map.new(
      item.quantity_by_size, fn {size, quantity} -> {size, quantity + count} end
    )

    %{item | quantity_by_size: quantity_by_size}
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_size, quantity}, accumulator -> accumulator + quantity end)
  end
end
