defmodule Sim.RegistryTest do
    use ExUnit.Case, async: true

    test "add to registry" do
        {:ok, registry} = Sim.Registry.start_link([])
        assert Sim.Registry.get(registry, "GRServer") == nil

        Sim.Registry.put(registry, "GRServer", { :test, :value})
        assert Sim.Registry.get(registry, "GRServer") == { :test, :value}
    end
end