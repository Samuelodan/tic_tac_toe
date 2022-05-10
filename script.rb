# frozen_string_literal: false

# creates tic tac toe grids
class Board
  attr_accessor :moves_left, :grid

  def initialize
    @grid = {
      1 => :_, 2 => :_, 3 => :_,
      4 => :_, 5 => :_, 6 => :_,
      7 => :_, 8 => :_, 9 => :_
    }
    @moves_left = true
  end

  def display_grid
    puts "  #{grid[1]} | #{grid[2]} | #{grid[3]} \n
  #{grid[4]} | #{grid[5]} | #{grid[6]} \n
  #{grid[7]} | #{grid[8]} | #{grid[9]}"
  end
end
