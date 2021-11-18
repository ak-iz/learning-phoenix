defmodule ChatWeb.MessageView do
  use ChatWeb, :view

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, __MODULE__, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{
      topic: message.topic,
      user: message.user,
      body: message.body,
      timestamp: message.inserted_at
    }
  end
end
