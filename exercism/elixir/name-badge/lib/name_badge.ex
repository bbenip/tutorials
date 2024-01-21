defmodule NameBadge do
  def print(id, name, department) do
    id_prefix = if id !== nil, do: "[#{id}] - ", else: ""
    department_suffix = if department !== nil, do: String.upcase("#{department}"), else: "OWNER"

    "#{id_prefix}#{name} - #{department_suffix}"
  end
end
