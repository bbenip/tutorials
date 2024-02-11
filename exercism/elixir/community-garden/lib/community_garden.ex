# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do: Agent.start(fn -> %{next_id: 1, registry: []} end, opts)

  def list_registrations(pid), do: Agent.get(pid, & &1.registry)

  def register(pid, register_to) do
    Agent.get_and_update(
      pid,
      fn %{next_id: id, registry: registry} ->
        new_plot = %Plot{plot_id: id, registered_to: register_to}
        {new_plot, %{next_id: id + 1, registry: [new_plot | registry]}}
      end
    )
  end

  def release(pid, plot_id) do
    Agent.update(
      pid,
      fn %{next_id: next_id, registry: registry} ->
        %{next_id: next_id, registry: Enum.filter(registry, & &1.plot_id !== plot_id)}
      end
    )
  end

  def get_registration(pid, plot_id) do
    Agent.get(
      pid,
      fn %{registry: registry} ->
        case Enum.find(registry, & &1.plot_id === plot_id) do
          %Plot{} = plot -> plot
          _ -> {:not_found, "plot is unregistered"}
        end
      end
    )
  end
end
