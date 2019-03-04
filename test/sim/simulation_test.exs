defmodule Sim.SimulationTest do
    use ExUnit.Case, async: true

    setup do
        start_supervised!(Sim.Supervisor)
        :ok
    end

    test "spawn simulation" do
        Sim.Simulation.add_template(Sim.Simulation, "fred", {:ok})
    end
end