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
    grid.value?(:_) || @moves_left = false
  end
end

# creates players for game
class Players
  def initialize
    @symbol = nil
  end
end
