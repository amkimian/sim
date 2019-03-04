defmodule Sim.Simulation do
    use GenServer

    ## A simulation is initially configured by sending it 
    ## configuration specs - we store them in the Registry
    ## Then we build the environment - we store them in the SimulationEnvironment
    ## We then start the simulation - that will periodically send
    ## tick events to all nodes, who will then send other messages to run
    ## the simulation.

    ## Finally our Simulation contains a data recorder that we use to record
    ## stats and status from each Node and transport - these services can
    ## all be interrogated for a web display of status and structure.

    @doc """
        Starts the Simulation Server
    """

    def start_link(opts) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    @doc """
        Adds some configuration of a template to the Registry
    """

    def add_template(server, name, config) do
        GenServer.cast(server, {:addTemplate, name, config})
    end

    ## Server callbacks

    def init(:ok) do
        {:ok, %{ }}
    end

    def handle_cast({:addTemplate, name, config}, simulation) do
        Sim.Registry.put(Sim.Registry,name,config)
        {:noreply, simulation}
    end

end