# frozen_string_literal: false

require './game'

# now, for the game flow
game = Game.new
puts 'This Tic Tac Toe session is starting now!'
game.assign_sym

game.board.display_grid # display board before before players make any move
# player moves loop
while game.board.moves_left
  game.board.next_turn = false
  until game.board.next_turn
    puts 'Player1: Enter a position between 1 and 9'
    game.board.make_move(game.player1, game.set_position)
    game.board.display_grid
    game.board.check_moves_left
    game.check_winner
  end

  break unless game.board.moves_left

  game.board.next_turn = false
  until game.board.next_turn
    puts 'Player2: Enter a position between 1 and 9'
    game.board.make_move(game.player2, game.set_position)
    game.board.display_grid
    game.board.check_moves_left
    game.check_winner
  end
end
