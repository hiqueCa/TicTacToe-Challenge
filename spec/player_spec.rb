require 'spec_helper'

describe Player do
  let(:available_player_markers) { described_class::AVAILABLE_PLAYER_MARKERS }
  let(:available_player_types) { described_class::AVAILABLE_PLAYER_TYPES }

  describe '#new' do
    before do
      @player = Player.new(type)
    end

    context 'when the player is human' do
      let(:type) { 'HUMAN' }
      let(:expected_type) { 'human' }
      let(:expected_marker) { 'O' }

      it 'initializes the correct type of Player object with the correct instance variables' do
        expect(@player).to be_an_instance_of(Player)
        expect(@player.type).to eq(expected_type)
        expect(@player.marker).to eq(expected_marker)
      end
    end

    context 'when the player is a computer' do
      let(:type) { 'COMPUTER' }
      let(:expected_type) { 'computer' }
      let(:expected_marker) { 'X' }

      it 'initializes the correct type of Player object with the correct instance variables' do
        expect(@player).to be_an_instance_of(Player)
        expect(@player.type).to eq(expected_type)
        expect(@player.marker).to eq(expected_marker)
      end
    end
  end
end