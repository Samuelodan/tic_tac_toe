# frozen_string_literal: false

require './board'
require './players'

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
end
