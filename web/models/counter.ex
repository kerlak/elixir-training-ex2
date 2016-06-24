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

  def limit do
    100
  end

  def count do
    Agent.get_and_update(__MODULE__, fn(old_value) -> {{:ok, old_value + 1}, old_value + 1} end)
  end
end
