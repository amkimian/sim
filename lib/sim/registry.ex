defmodule Sim.Registry do
    use Agent
    
    @doc """
    Starts a new registry
    """

    def start_link(_opts) do
        Agent.start_link(fn -> %{} end)
    end

    @doc """
        Retrieve from registry
    """
    def get(registry, key) do 
        Agent.get(registry, &Map.get(&1, key))
    end

    @doc """
    Put into registry
    """
    def put(registry, key, value) do
        Agent.update(registry, &Map.put(&1, key, value))
    end
end