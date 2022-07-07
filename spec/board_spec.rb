# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/players'

RSpec.describe Board do
  subject(:board) { described_class.new }
  let(:xplayer) { instance_double(Players, symbol: :x) }

  describe '#make_move' do
    context 'when position is already taken' do
      position = 3
      before do
        board.grid[3] = :y
      end

      it 'puts a message' do
        expect(board).to receive(:puts).with('That position is already taken')
        board.make_move(xplayer, position)
      end

      it 'does not register move' do
        board.make_move(xplayer, position)
        expect(board.grid[position]).to_not be :x
      end
    end

    context 'when position is available' do
      position = 3
      it 'does not puts a message' do
        expect(board).to_not receive(:puts).with('That position is already taken')
        board.make_move(xplayer, position)
      end

      it 'registers move' do
        board.make_move(xplayer, position)
        expect(board.grid[position]).to be :x
      end
    end
  end
end