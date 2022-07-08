# frozen_string_literal: false

# creates tic tac toe grids
class Board
  attr_reader :grid, :moves_left, :next_turn

  def initialize
    @grid = {
      1 => :_, 2 => :_, 3 => :_,
      4 => :_, 5 => :_, 6 => :_,
      7 => :_, 8 => :_, 9 => :_
    }
    @moves_left = true
    @next_turn = false
  end

  WIN_POSITIONS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze

  def display_grid
    puts "  #{grid[1]} | #{grid[2]} | #{grid[3]} \n
  #{grid[4]} | #{grid[5]} | #{grid[6]} \n
  #{grid[7]} | #{grid[8]} | #{grid[9]}"
  end

  def make_move(player, position)
    unless @grid[position] == :_
      puts 'That position is already taken'
      return false #remember to delete this
    end
    @grid[position] = player.symbol
    @next_turn = true
  end
 
  def winning_symbol
    WIN_POSITIONS.each do |pos|
      values = grid[pos[0]], grid[pos[1]], grid[pos[2]]
      value = values.uniq
      return value[0] if value.length == 1 && value[0] != :_
    end
    nil
  end

  def check_moves_left
    unless grid.value?(:_)
      puts "No moves left!\nThe match has ended in a draw."
      @moves_left = false
    end
  end

  def reset_turn
    @next_turn = false
  end

  def no_moves_left
    @moves_left = false
  end
end
