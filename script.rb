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

  def winning_symbol
    x = :x
    o = :o

    if grids[1] == x && grids[2] == x && grids[3] == x || # 123
       grids[4] == x && grids[5] == x && grids[6] == x || # 456
       grids[7] == x && grids[8] == x && grids[9] == x || # 789
       grids[1] == x && grids[4] == x && grids[7] == x || # 147
       grids[2] == x && grids[5] == x && grids[8] == x || # 258
       grids[3] == x && grids[6] == x && grids[9] == x || # 369
       grids[1] == x && grids[5] == x && grids[9] == x || # 159
       grids[3] == x && grids[5] == x && grids[7] == x # 357

      x

    elsif grids[1] == o && grids[2] == o && grids[3] == o || # 123
          grids[4] == o && grids[5] == o && grids[6] == o || # 456
          grids[7] == o && grids[8] == o && grids[9] == o || # 789
          grids[1] == o && grids[4] == o && grids[7] == o || # 147
          grids[2] == o && grids[5] == o && grids[8] == o || # 258
          grids[3] == o && grids[6] == o && grids[9] == o || # 369
          grids[1] == o && grids[5] == o && grids[9] == o || # 159
          grids[3] == o && grids[5] == o && grids[7] == o # 357

      o
    end
  end
end
