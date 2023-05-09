require_relative './spec_helper'

describe Board do
  let(:board) { Board.new }
  let(:state) { board.state }

  describe '#new' do
    let(:initial_board_state) { %w[0 1 2 3 4 5 6 7 8] }

    it 'creates a new instance of Board with the correct attributes' do
      expect(board).to be_an_instance_of(Board)
      expect(board.state).to eq(initial_board_state)
    end
  end

  describe '.to_s' do
    subject { board.to_s }

    it 'prints the board correctly formatted on screen' do
      expect(subject).to eq(
        "\s#{state[0]} | #{state[1]} | #{state[2]} \n===+===+===\n #{state[3]} | #{state[4]} | #{state[5]} \n===+===+===\n #{state[6]} | #{state[7]} | #{state[8]} \n"
      )
    end
  end

  describe '.row_uniquelly_filled?' do
    subject { board.row_uniquelly_filled? }

    context 'when a given board row is uniquelly filled' do
      before do
        state[0] = 'X'
        state[1] = 'X'
        state[2] = 'X'
      end

      it 'return true' do
        expect(subject).to be true
      end
    end

    context 'when a given board row is  not uniquelly filled' do
      before do
        state[0] = 'X'
        state[1] = 'X'
        state[2] = '2'
      end

      it 'return true' do
        expect(subject).to be false
      end
    end
  end

  describe '.column_uniquelly_filled?' do
    subject { board.column_uniquelly_filled? }

    context 'when a given board column is uniquelly filled' do
      before do
        state[0] = 'X'
        state[3] = 'X'
        state[6] = 'X'
      end

      it 'return true' do
        expect(subject).to be true
      end
    end

    context 'when a given board column is  not uniquelly filled' do
      before do
        state[0] = 'X'
        state[3] = 'X'
        state[6] = '2'
      end

      it 'return true' do
        expect(subject).to be false
      end
    end
  end

  describe '.diagonal_uniquelly_filled?' do
    subject { board.diagonal_uniquelly_filled? }

    context 'when a given board diagonal is uniquelly filled' do
      before do
        state[0] = 'X'
        state[4] = 'X'
        state[8] = 'X'
      end

      it 'return true' do
        expect(subject).to be true
      end
    end

    context 'when a given board column is  not uniquelly filled' do
      before do
        state[0] = 'X'
        state[4] = 'X'
        state[8] = '2'
      end

      it 'return true' do
        expect(subject).to be false
      end
    end
  end
end