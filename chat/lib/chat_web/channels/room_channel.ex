defmodule ChatWeb.RoomChannel do
  use ChatWeb, :channel

  alias ChatWeb.{
    MessageView,
    Presence
  }

  def join("room:lobby", _params, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def join(_other, _params, _socket) do
    {:error, "Room does not exists."}
  end

  def handle_info(:after_join, socket) do
    socket |> track_presence() |> send_recent_messages()

    {:noreply, socket}
  end

  def handle_in("message:new", body, socket) do
    message =
      Chat.Repo.insert!(%Chat.Message{
        topic: socket.topic,
        user: socket.assigns.user,
        body: body
      })

    broadcast!(socket, "message:new", MessageView.render("message.json", %{message: message}))

    {:noreply, socket}
  end

  defp track_presence(socket) do
    push(socket, "presence_state", Presence.list(socket))

    Presence.track(socket, socket.assigns.user, %{
      online_at: :os.system_time(:milli_seconds)
    })

    socket
  end

  defp send_recent_messages(socket) do
    messages = socket.topic |> Chat.Message.recent() |> Chat.Repo.all()
    push(socket, "messages:recent", MessageView.render("index.json", %{messages: messages}))
    socket
  end
end
