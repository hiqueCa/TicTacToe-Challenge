require 'spec_helper'

describe Player do
  let(:available_player_markers) { described_class::AVAILABLE_PLAYER_MARKERS }
  let(:available_player_types) { described_class::AVAILABLE_PLAYER_TYPES }

  describe '#new' do
    before do
      @player = Player.new(type)
    end

    context 'when the player is human' do
      let(:type) { 'human' }

      it 'initializes the correct type of Player object with the correct instance variables' do
        expect(@player).to be_an_instance_of(Player)
        expect(@player.type).to eq(available_player_types[type])
        expect(@player.marker).to eq(available_player_markers[type])
      end
    end
  end
end