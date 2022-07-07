# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/players'

RSpec.describe Board do
  subject(:board) { described_class.new }
  let(:xplayer) { double(Players, symbol: :x) }
  let(:yplayer) { double(Players, symbol: :o) }

  describe '#make_move' do
    context 'when position is already taken' do
      position = 3
      before do
        board.grid[3] = :o
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

  describe '#winning_symbol' do
    context 'when xplayer wins round' do
      before do
        board.grid[7], board.grid[8], board.grid[9] = :x, :x, :x 
      end

      it 'returns :x' do
        value = board.winning_symbol
        expect(value).to be :x 
      end
    end

    context 'when yplayer wins round' do
      before do
        board.grid[7], board.grid[8], board.grid[9] = :o, :o, :o
      end

      it 'returns :y' do
        value = board.winning_symbol
        expect(value).to be :o
      end
    end
  end
end
