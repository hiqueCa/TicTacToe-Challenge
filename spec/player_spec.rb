require_relative 'spec_helper'

describe Player do
  let(:marker) { 'X' }
  let(:name) { 'bleus' }
  let(:board) { Board.new }
  let(:player) { Player.new(marker, name) }

  describe '#new' do
    it 'initializes the correct type of Player object with the correct instance variables' do
      expect(player).to be_an_instance_of(Player)
      expect(player.move_trials).to match_array([])
      expect(player.last_valid_move).to be_nil
      expect(player.marker).to eq(marker)
      expect(player.name).to eq(name)
      expect(player.type).to be_nil
    end
  end

  describe '.try_move' do
    subject { player.try_move(board, input_position) }

    context 'when the input_position is valid' do
      let(:input_position) { '1' }

      it 'creates a new move trial instance for the player' do
        expect { subject }.to change { player.move_trials.count }.by(1)
      end

      it 'sets the last_valid_move as the last move trial' do
        subject

        expect(player.last_valid_move).to be_an_instance_of(Move)
        expect(player.last_valid_move).to eq(player.move_trials.last)
      end
    end

    context 'when the input_position is invalid' do
      let(:input_position) { ';' }

      it 'creates a new move trial instance for the player' do
        expect { subject }.to change { player.move_trials.count }.by(1)
      end

      it 'does not set the last_valid_move as the last move trial' do
        subject

        expect(player.last_valid_move).to be_nil
        expect(player.last_valid_move).not_to eq(player.move_trials.last)
      end
    end
  end

  describe '.last_move_was_valid?' do
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

  describe '.place_marker_on_last_valid_position' do
    let(:input_position) { '2' }
    subject { player.place_marker_on_last_valid_position(board) }

    before do
      player.try_move(board, input_position)
    end

    it "places the player's marker on the last_valid_position" do
      subject
      expect(board.state[player.last_valid_move.valid_position]).to eq(marker)
    end
  end

  describe '.to_s' do
    subject { player.to_s }

    it "prints the player's name as its stdout representation" do
      expect(subject).to eq(player.name)
    end
  end
end