defmodule Countdown.ArenaChannel do
  use Phoenix.Channel

  alias Countdown.Counter

  def join("arenas:lobby", _message, socket) do
    {:ok, %{counter: Counter.value}, socket}
  end

  def handle_in("count", _message, socket) do
    {state, counter} = Counter.count
    broadcast! socket, "update", %{counter: counter}
    case state do
      :ok -> {:reply, {:ok, %{won: false, counter: counter}}, socket}
      :overflow -> {:reply, {:ok, %{won: true, counter: counter}}, socket}
    end
  end
end
