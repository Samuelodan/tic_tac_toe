# frozen_string_literal: true

require_relative '../lib/players'

RSpec.describe Players do
  subject(:player) { Players.new }

  describe '#set_symbol' do
    context 'when argument is :x or :o' do
      it 'sets symbol to argument' do
        player.set_symbol(:x)
        expect(player.symbol).to be :x
      end
      
      it 'sets symbol to argument' do
        player.set_symbol(:o)
        expect(player.symbol).to be :o
      end
    end

    context 'when argument is not :x or :y' do
      it 'does not set symbol to argument' do
        expect { player.set_symbol(:y) }.to_not change { player.symbol }
      end
    end
  end
end
