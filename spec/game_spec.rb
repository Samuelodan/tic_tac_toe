# frozen_string_literal: true

require_relative '../lib/game'

RSpec.describe Game do
  let(:board) { instance_double(Board) }
  let(:player1) { instance_double(Players) }
  let(:player2) { instance_double(Players) }

  subject(:game) do 
    described_class.new(board: board, player1: player1, player2: player2)
  end

  describe '#assign_sym' do
    before do
      allow(player1).to receive(:set_symbol)
      allow(player2).to receive(:set_symbol)
      allow(game).to receive(:puts)
    end

    it 'sends message to player1 object' do
      expect(player1).to receive(:set_symbol).with(:x)
      game.assign_sym
    end
    it 'sends message to player2 object' do
      expect(player2).to receive(:set_symbol).with(:o)
      game.assign_sym
    end
  end

  describe '#check_winner' do
    context 'when winning symbol is :x' do
      before do
        allow(board).to receive(:winning_symbol).and_return(:x)
        allow(game).to receive(:puts)
        allow(board).to receive(:no_moves_left)
      end

      it 'outputs victory message' do
        expect(game).to receive(:puts)
        game.check_winner
      end

      it 'sends message to board' do
        expect(board).to receive(:no_moves_left)
        game.check_winner
      end
    end
    
    context 'when winning symbol is :o' do
      before do
        allow(board).to receive(:winning_symbol).and_return(:o)
        allow(game).to receive(:puts)
        allow(board).to receive(:no_moves_left)
      end

      it 'outputs victory message' do
        expect(game).to receive(:puts)
        game.check_winner
      end

      it 'sends message to board' do
        expect(board).to receive(:no_moves_left)
        game.check_winner
      end
    end
  end

  describe '#get_position' do
    context 'when player enters an invalid position followed by valid' do
      before do
        allow(game).to receive(:gets).and_return('12', '9')
        allow(game).to receive(:puts)
      end

      it 'outputs an error message once' do
        expect(game).to receive(:puts).with('please enter a valid number').once
        game.get_position
      end
    end

    context 'when player enters an invalid position twice followed by valid' do
      before do
        allow(game).to receive(:gets).and_return('12', '21', '9')
        allow(game).to receive(:puts)
      end

      it 'outputs an error message twice' do
        expect(game).to receive(:puts).with('please enter a valid number').twice
        game.get_position
      end
    end

    context 'when player enters a valid position' do
      valid_input = '9'
      before do
        allow(game).to receive(:gets).and_return(valid_input)
      end

      it 'does not output an error message' do
        expect(game).to_not receive(:puts).with('please enter a valid number')
        game.get_position
      end

      it 'returns position as integer of valid input' do
        position = game.get_position
        expect(position).to be valid_input.to_i
      end
    end
  end

  # I believe these tests should be more integration vs unit
  describe '#play' do
    # so, I'll just leave this blank for now since I've tested
    # the critical methods contained within it
  end
end
