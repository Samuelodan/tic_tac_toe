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
end
