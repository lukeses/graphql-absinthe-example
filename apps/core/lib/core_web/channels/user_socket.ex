defmodule CoreWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket,
    schema: CoreWeb.Schema

  transport :websocket, Phoenix.Transports.WebSocket

  # def connect(params, socket) do
  #   current_user = current_user(params)
  #   socket = Absinthe.Phoenix.Socket.put_opts(socket, context: %{
  #     current_user: current_user
  #   })
  #   {:ok, socket}
  # end

  # defp current_user(%{"user_id" => id}) do
  #   MyApp.Repo.get(User, id)
  # end
  # def connect(_params, socket) do
  #   {:ok, assign(socket, :absinthe, %{schema: CoreWeb.Schema})}
  # end

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end