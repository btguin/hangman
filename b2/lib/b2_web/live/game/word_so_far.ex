defmodule B2Web.Live.Game.WordSoFar do
  use B2Web, :live_component

  @states %{
    already_used: "You already used that letter",
    bad_guess: "Bad guess",
    good_guess: "Good guess",
    initializing: "Type or click on your first guess",
    lost: "Sorry, you lost...",
    won: "You won!"
  }

  def mount(socket) do
    {:ok, socket}
  end

  defp state_name(state) do
    @states[state] || "Unknown state"
  end

  def render(assigns) do
    ~H"""
    <div class="word_so_far">
      <div class="game-state">
        <%= state_name(@tally.game_state) %>
      </div>
      <div class="letters">
        <%= for ch <- @tally.letters do %>
          <div class={"one-letter #{if ch != "_", do: "correct"}"}>
            <%= ch %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
