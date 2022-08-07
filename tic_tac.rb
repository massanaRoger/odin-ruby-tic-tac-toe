# frozen_string_literal: true

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @game_array = Array.new(9, '%')
  end

  def play_game
    end_game = false
    player_index = 0
    until end_game
      player = player_index.zero? ? @player1 : @player2
      end_game = play_round(player)
      player_index = 1 - player_index
    end
    player.add_point
    player.name
  end

  def play_round(player)
    print_screen
    correct = false
    until correct
      correct = true
      puts 'Introduce the row and column to change'
      puts 'Row:'
      row = gets.chomp.to_i - 1
      puts 'Column:'
      column = gets.chomp.to_i - 1
      if row > 3 || column > 3
        puts "Column / row can't be more than 3, try again"
        correct = false
      else
        move = player.move
        correct = update_array(row, column, move)
        return winner?(row, column, move) if correct
      end
    end
  end

  private

  def print_screen
    puts "|#{@game_array[0]}|#{@game_array[1]}|#{@game_array[2]}|"
    puts "|#{@game_array[3]}|#{@game_array[4]}|#{@game_array[5]}|"
    puts "|#{@game_array[6]}|#{@game_array[7]}|#{@game_array[8]}|"
  end

  def update_array(row, col, input)
    pos_to_update = row * 3 + col
    if @game_array[pos_to_update] == '%'
      @game_array[pos_to_update] = input
      return true
    end
    puts 'Please select an empty position, try again'
    false
  end

  def winner?(row, col, input)
    pos = row * 3 + col
    pos_y = row * 3
    if @game_array[pos] == input && @game_array[(pos + 3) % 9] == input && @game_array[(pos + 3) % 9] == input
      puts 'You won!'
      return true
    elsif @game_array[pos_y + col] == input && @game_array[pos_y + ((col + 1) % 3)] == input &&
          @game_array[pos_y + ((col + 2)) % 3] == input
      puts 'You won!'
      return true
    elsif @game_array[0] == input && @game_array[4] == input && @game_array[8] == input
      puts 'You won!'
      return true
    elsif @game_array[2] == input && @game_array[4] == input && @game_array[6] == input
      puts 'You won!'
      return true
    end
    false
  end
end

class Player
  attr_reader :name, :move, :points

  def initialize(name, move)
    @name = name
    @move = move
    @points = 0
  end

  def add_point
    @points += 1
  end
end

def play
  puts "What's player 1 name?"
  player1_name = gets.chomp
  puts "What's player 2 name?"
  player2_name = gets.chomp
  player1 = Player.new(player1_name, 'X')
  player2 = Player.new(player2_name, 'O')
  loop do
    game = Game.new(player1, player2)
    winner = game.play_game
    puts "The winner is #{winner}"
    puts "Player 1 points: #{player1.name} = #{player1.points}"
    puts "Player 2 points: #{player2.name} = #{player2.points}"
  end
end

play
