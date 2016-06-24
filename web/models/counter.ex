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
    Agent.get_and_update(__MODULE__, fn(old_value) ->
      new_value = old_value + 1
      case new_value do
        100 -> {{:overflow, 0}, 0}
        _ -> {{:ok, new_value}, new_value}
      end
    end)
  end

  def set(new_value) do
    Agent.update(__MODULE__, fn(_) -> new_value end)
  end
end
