defmodule Hangman do
  # alias Hangman.Impl.Game
  alias Hangman.Type
  alias Hangman.Runtime.Server

  @opaque game :: Server.t()
  @type tally :: Type.tally()

  @spec new_game() :: game
  def new_game do
    {:ok, pid} = Hangman.Runtime.Application.start_game()
    pid
  end

  # @spec make_move(game, String.t()) :: {game, tally}

  @spec make_move(game, String.t()) :: tally
  def make_move(game, guess) do
    GenServer.call(game, {:make_move, guess})
  end

  @spec tally(game) :: tally()
  def tally(game) do
    GenServer.call(game, {:tally})
  end
end
