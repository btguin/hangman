defmodule B1Web.HangmanController do
  use B1Web, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def new(conn, _params) do
    game = Hangman.new_game()

    conn
    |> put_session(:game, game)
    # Changed this line
    |> redirect(to: ~p"/hangman/current")
  end

  def update(conn, params) do
    guess = params["make_move"]["guess"]

    put_in(conn.params["make_move"]["guess"], "")
    |> get_session(:game)
    |> Hangman.make_move(guess)

    # Changed this line
    redirect(conn, to: ~p"/hangman/current")
  end

  def show(conn, _param) do
    tally =
      conn
      |> get_session(:game)
      |> Hangman.tally()

    render(conn, "game.html", tally: tally)
  end

 
end
