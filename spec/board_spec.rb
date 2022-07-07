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

    context "When there's no winner" do
      it 'returns nil' do
        value = board.winning_symbol
        expect(value).to be nil
      end
    end
  end

  describe '#check_moves_left' do
    context 'when there are no moves left' do
      before do
        allow(board).to receive(:puts)
        board.grid[1], board.grid[2], board.grid[3] = :x, :x, :x
        board.grid[4], board.grid[5], board.grid[6] = :y, :y, :y
        board.grid[7], board.grid[8], board.grid[9] = :x, :x, :x
      end

      it 'outputs an error message' do
        expect(board).to receive(:puts)
        board.check_moves_left
      end

      it 'sets @moves_left to false' do
        expect { board.check_moves_left }.to change { board.moves_left }.to (false)
      end
    end
    context 'when there are still moves left' do
      it 'does not output an error message' do
        expect(board).to_not receive(:puts)
        board.check_moves_left
      end

      it 'does not change @moves_left' do
        expect { board.check_moves_left }.to_not change { board.moves_left }
      end
    end
  end

  describe '#reset_turn' do
    before do
      board.instance_variable_set(:@next_turn, true)
    end

    it 'sets @next_turn to false' do
      expect { board.reset_turn }.to change { board.next_turn }.to false
    end
  end
end
