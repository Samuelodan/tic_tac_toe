# frozen_string_literal: false

# creates tic tac toe grids
class Board
  attr_accessor :next_turn, :moves_left
  attr_reader :grid

  def initialize
    @grid = {
      1 => :_, 2 => :_, 3 => :_,
      4 => :_, 5 => :_, 6 => :_,
      7 => :_, 8 => :_, 9 => :_
    }
    @moves_left = true
    @next_turn = false
  end

  def display_grid
    puts "  #{grid[1]} | #{grid[2]} | #{grid[3]} \n
  #{grid[4]} | #{grid[5]} | #{grid[6]} \n
  #{grid[7]} | #{grid[8]} | #{grid[9]}"
  end

  def make_move(player, position)
    unless @grid[position] == :_ # changes here
      puts 'That position is already taken'
      return false
    end
    @grid[position] = player.symbol # changes here
    @next_turn = true
  end

  def winning_symbol
    x = :x
    o = :o

    if grid[1] == x && grid[2] == x && grid[3] == x || # 123
       grid[4] == x && grid[5] == x && grid[6] == x || # 456
       grid[7] == x && grid[8] == x && grid[9] == x || # 789
       grid[1] == x && grid[4] == x && grid[7] == x || # 147
       grid[2] == x && grid[5] == x && grid[8] == x || # 258
       grid[3] == x && grid[6] == x && grid[9] == x || # 369
       grid[1] == x && grid[5] == x && grid[9] == x || # 159
       grid[3] == x && grid[5] == x && grid[7] == x # 357

      x

    elsif grid[1] == o && grid[2] == o && grid[3] == o || # 123
          grid[4] == o && grid[5] == o && grid[6] == o || # 456
          grid[7] == o && grid[8] == o && grid[9] == o || # 789
          grid[1] == o && grid[4] == o && grid[7] == o || # 147
          grid[2] == o && grid[5] == o && grid[8] == o || # 258
          grid[3] == o && grid[6] == o && grid[9] == o || # 369
          grid[1] == o && grid[5] == o && grid[9] == o || # 159
          grid[3] == o && grid[5] == o && grid[7] == o # 357

      o
    end
  end

  def check_moves_left
    unless grid.value?(:_)
      puts "No moves left!\nThe match has ended in a draw."
      @moves_left = false
    end
  end
end

# creates players for game
class Players
  attr_accessor :symbol

  def initialize
    @symbol = nil
  end
end

# creates game object that contains other objects
class Game
  attr_accessor :board, :player1, :player2, :next_turn

  def initialize
    @board = Board.new
    @player1 = Players.new
    @player2 = Players.new
  end

  def assign_sym
    @player1.symbol = :x
    @player2.symbol = :o
    puts "player1 is x\nplayer2 is o"
  end

  def check_winner
    case board.winning_symbol
    when :x
      puts 'Player1 has won the game'
      board.moves_left = false
    when :o
      puts 'Player2 has won the game'
      board.moves_left = false
    else
      false
    end
  end
end

# now, for the game flow
game = Game.new
puts 'This Tic Tac Toe session is starting now!'
game.assign_sym

# this method accepts only valid input from players
def set_position
  puts
  position = gets.chomp.to_i
  until (position.is_a? Numeric) && position.positive? && position < 10
    puts 'please enter a valid number'
    position = gets.chomp.to_i
  end
  position
end

game.board.display_grid # display board before before players make any move
# player moves loop
while game.board.moves_left
  game.board.next_turn = false
  until game.board.next_turn
    puts 'Player1: Enter a position between 1 and 9'
    game.board.make_move(game.player1, set_position)
    game.board.display_grid
    game.board.check_moves_left
    game.check_winner
  end

  break unless game.board.moves_left

  game.board.next_turn = false
  until game.board.next_turn
    puts 'Player2: Enter a position between 1 and 9'
    game.board.make_move(game.player2, set_position)
    game.board.display_grid
    game.board.check_moves_left
    game.check_winner
  end
end
