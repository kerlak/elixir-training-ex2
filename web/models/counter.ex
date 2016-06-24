defmodule Countdown.Counter do
  def start_link do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def reset do
    Agent.update(__MODULE__, fn(_) -> 0 end)
  end

  def value do
    Agent.get(__MODULE__, fn(v) -> v end)
  end
end
