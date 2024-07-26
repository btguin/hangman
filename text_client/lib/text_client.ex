# defmodule TextClient do
#   @spec start() :: atom()
#   def start do
#     TextClient.Runtime.RemoteHangman.connect()
#     |> TextClient.Impl.Player.start()
#   end
# end

defmodule TextClient do
  def start() do
    case TextClient.Runtime.RemoteHangman.connect() do
      {:ok, game} ->
        TextClient.Impl.Player.start(game)

      {:error, reason} ->
        IO.puts("Failed to start game: #{inspect(reason)}")
    end
  end
end
