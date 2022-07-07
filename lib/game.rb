# frozen_string_literal: false

require_relative './board'
require_relative './players'

# creates game object that contains other objects
class Game
  attr_accessor :board
  attr_reader :player1, :player2

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

  def set_position
    puts
    position = gets.chomp.to_i
    until (position.is_a? Integer) && position.positive? && position < 10
      puts 'please enter a valid number'
      position = gets.chomp.to_i
    end
    position
  end

  def play
    puts 'This Tic Tac Toe session is starting now!'
    assign_sym
    board.display_grid
    while board.moves_left
      board.reset_turn
      until board.next_turn
        puts 'Player1: Enter a position between 1 and 9'
        board.make_move(player1, set_position)
        board.display_grid
        board.check_moves_left
        check_winner
      end

      break unless board.moves_left

      board.reset_turn
      until board.next_turn
        puts 'Player2: Enter a position between 1 and 9'
        board.make_move(player2, set_position)
        board.display_grid
        board.check_moves_left
        check_winner
      end
    end
  end
end
