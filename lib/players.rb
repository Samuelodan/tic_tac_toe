# frozen_string_literal: false

# creates players for game
class Players
  attr_reader :symbol

  def initialize
    @symbol = nil
  end

  def set_symbol(sym)
    @symbol = sym if sym == :x
    @symbol = sym if sym == :o
  end
end
