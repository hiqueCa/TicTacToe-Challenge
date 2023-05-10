require 'spec_helper'

describe Player do
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

  describe '.try_move' do
    let(:board) { Board.new() }
    let(:player) { Player.new('HUMAN') }

    subject { player.try_move(board, input_position) }

    context 'when the input_position is valid' do
      let(:input_position) { '1' }

      it 'creates a new valid Move instance for the player' do
        expect { subject }.to change { player.moves.count }.by(1)
        expect(player.last_valid_move).to be_an_instance_of(Move)
        expect(player.last_valid_move).to eq(player.moves.last)
      end
    end

    context 'when the input_position is invalid' do
      let(:input_position) { ';' }

      it 'creates a new invalid Move instance for the player' do
        expect { subject }.to change { player.moves.count }
        expect(player.last_valid_move).to be_nil
        expect(player.last_valid_move).not_to eq(player.moves.last)
      end
    end
  end

  describe '.last_move_was_valid?' do
    let(:player) { Player.new('HUMAN') }
    let(:board) { Board.new() }

    subject { player.last_move_was_valid? }

    before do
      player.try_move(board, input_position)
    end

    context 'when the input position is valid' do
      let(:input_position) { '1' }

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when the input position is invalid' do
      let(:input_position) { 'bleus' }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end
end