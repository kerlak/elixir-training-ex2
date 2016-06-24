defmodule Countdown.ArenaChannel do
  use Phoenix.Channel

  def join("arenas:lobby", _message, socket) do
    {:ok, %{counter: 0}, socket}
  end
end
