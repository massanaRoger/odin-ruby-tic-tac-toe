# frozen_string_literal: true

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @end = false
    @game_array = Array.new(9, '%')
  end

  def play_round
    print_screen
    correct = false
    until correct
      correct = true
      puts 'Introduce the row and column to change'
      puts 'Row:'
      row = gets.chomp.to_i + 1
      puts 'Column:'
      column = gets.chomp.to_i + 1
      puts "#{row}, #{column}"
      if row > 3 || column > 3
        puts "Column / row can't be more than 3, try again"
        correct = false
      else
        puts 'Want to play X or O?'
        move = gets.chomp.upcase
        unless %w[X O].include?(move)
          puts 'You have to input X or O, try again'
          correct = false
        end
      end
    end
  end

  private

  def print_screen
    puts "|#{@game_array[0]}|#{@game_array[1]}|#{@game_array[2]}|"
    puts "|#{@game_array[3]}|#{@game_array[4]}|#{@game_array[5]}|"
    puts "|#{@game_array[6]}|#{@game_array[7]}|#{@game_array[8]}|"
  end
end

class Player
  def initialize(name)
    @name = name
  end
end

player1 = Player.new('Roger')
player2 = Player.new('XD')
game = Game.new(player1, player2)
game.play_round
