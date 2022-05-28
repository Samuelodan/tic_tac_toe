# frozen_string_literal: false

require './game'

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
