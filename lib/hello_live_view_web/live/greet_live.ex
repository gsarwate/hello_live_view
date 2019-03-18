defmodule HelloLiveViewWeb.GreetLive do
  use Phoenix.LiveView

  @greet_list [
    "hello",
    "hola",
    "नमस्ते",
    "bonjour",
    "こんにちは",
    "مرحبا",
    "γεια σας",
    "Привет"
  ]

  def render(assigns) do
    ~L"""
    <div>
      <h1> <%= @greet %></h1>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)

    # {:ok, assign(socket, :greet, "hello")}
    {:ok, random_greet(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, random_greet(socket)}
  end

  defp random_greet(socket) do
    assign(socket, greet: Enum.random(@greet_list))
  end
end
