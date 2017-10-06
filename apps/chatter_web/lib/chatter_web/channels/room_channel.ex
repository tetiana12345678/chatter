defmodule ChatterWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", payload, socket) do
    broadcast! socket, "new_message", payload
    bot_payload = Bot.answer(payload)
    :timer.sleep(100)
    case bot_payload do
      {:ok, answer} ->
        broadcast! socket, "new_message", answer
      {:noreply, _} -> true
    end
    {:noreply, socket}
  end
end
