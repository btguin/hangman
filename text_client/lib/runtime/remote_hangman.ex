# defmodule TextClient.Runtime.RemoteHangman do
#   def connect() do
#     :rpc.call(:"hangman@bryans-air", Hangman, :new_game, [])
#   end
# end

defmodule TextClient.Runtime.RemoteHangman do
  def connect() do
    :rpc.call(:"hangman@bryans-air", Hangman, :new_game, [])
    |> handle_response()
  end

  defp handle_response(game) when is_pid(game), do: {:ok, game}
  defp handle_response({:badrpc, reason}), do: {:error, reason}
  defp handle_response(other), do: {:error, {:unexpected_response, other}}
end
