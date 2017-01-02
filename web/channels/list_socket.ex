defmodule Storyer.ListChannal do
  use Phoenix.Channel

  def join("lobby", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_story", payload, socket) do
    broadcast! socket, "new_story", payload
    {:noreply, socket}
  end
end
