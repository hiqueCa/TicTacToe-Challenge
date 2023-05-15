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
      board.state[4] = central_dominance_spot
    end

    subject { computer.make_move(game, player_one) }

    context 'when central dominance spot is available on board' do
      let(:central_dominance_spot) { '4' } 

      it 'creates a new move trial for the computer' do
        expect { subject }.to change { computer.move_trials.count }.by(1)
      end

      it "sets the computer's last_valid_move as the last move trial available" do
        subject
        expect(computer.last_valid_move).to eq(computer.move_trials.last)
      end

      it 'defines the central dominance spot as the move for the computer' do
        subject
        expect(computer.last_valid_move.valid_position).to eq(4)
      end
    end

    context 'when central dominance spot is not available on board' do
      let(:central_dominance_spot) { 'X' } 

      it 'creates a new move trial for the computer' do
        expect { subject }.to change { computer.move_trials.count }.by(1)
      end

      it "sets the computer's last_valid_move as the last move trial available" do
        subject
        expect(computer.last_valid_move).to eq(computer.move_trials.last)
      end

      it 'does not set the central dominance spot as the move for the computer' do
        subject
        expect(computer.last_valid_move.valid_position).not_to eq(4)
      end

      it 'calls the Computer.define_best_move method' do
        expect(computer)
          .to receive(:define_best_available_move)
            .with(game, player_one)
              .and_call_original
        
        subject
      end
    end
  end
end