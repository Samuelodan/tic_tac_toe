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

      it 'it outputs victory message' do
        expect(game).to receive(:puts)
        game.check_winner
      end
    end
  end
end
