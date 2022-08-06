# frozen_string_literal: true

class Game
  @end = false
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
end

class Player
  def initialize(name)
    @name = name
  end
end
