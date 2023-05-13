require_relative 'spec_helper'

describe Computer do
  let(:marker) { 'O' }
  let(:name) { 'bleus' }
  let(:computer) { Computer.new(marker, name) }

  describe '#new' do
    it 'creates an instance of Computer with the correct attributes' do
      expect(computer).to be_an_instance_of(Computer)
      expect(computer.type).to eq('computer')
      expect(computer.marker).to eq(marker)
      expect(computer.name).to eq(name)
      expect(computer.move_trials).to match_array([])
      expect(computer.last_valid_move).to be_nil
    end

    it 'creates a Computer instance which should inherit from Player superclass' do
      expect(described_class).to be < Player
    end
  end

  describe '.make_move' do
    let(:game_type) { 'CPU_CPU' }
    let(:game) { Game.new(game_type) }
    let(:board) { game.board }
    let(:player_one) { game.player_one }
    let(:computer) { game.player_two }

    before do
      board.state = board_state
    end

    subject { computer.make_move(game, player_one) }

    context 'when central dominance spot is available on board' do
      let(:board_state) { %[0 X 2 O 4 5 6 X 8] }

      it 'creates a new move trial for the computer' do
        expect { subject }.to change { computer.move_trials.count }.by(1)
      end

      it "sets the computer's last_valid_move as the last move trial available" do
        expect(computer.last_valid_move).to eq(computer.move_trials.last)
      end
    end

    context 'when central dominance spot is not available on board' do
      let(:board_state) { %[0 X 2 O O 5 6 X 8] }

      it 'creates a new move trial for the computer' do
        expect { subject }.to change { computer.move_trials.count }.by(1)
      end

      it "sets the computer's last_valid_move as the last move trial available" do
        expect(computer.last_valid_move).to eq(computer.move_trials.last)
      end
    end
  end
end