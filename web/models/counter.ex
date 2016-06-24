defmodule Countdown.Counter do
  def start_link do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end
end
