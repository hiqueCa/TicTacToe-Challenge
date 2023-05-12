require_relative './spec_helper'

describe Board do
  let(:board) { Board.new }
  let(:state) { board.state }

  describe '#new' do
    let(:initial_board_state) { %w[0 1 2 3 4 5 6 7 8] }

    it 'creates a new instance of Board with the correct attributes' do
      expect(board).to be_an_instance_of(Board)
      expect(board.state).to eq(initial_board_state)
      expect(board.first_uniquelly_filled_column).to match_array([])
      expect(board.first_uniquelly_filled_row).to match_array([])
      expect(board.first_uniquelly_filled_diagonal).to match_array([])
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
      let(:row) { [state[0], state[1], state[2]] }

      before do
        state[0] = 'X'
        state[1] = 'X'
        state[2] = 'X'
      end

      it 'returns true' do
        expect(subject).to be true
      end

      it 'sets the row as first_uniquelly_filled_row' do
        subject
        expect(board.first_uniquelly_filled_row).to match_array(row)
      end
    end

    context 'when a given board row is  not uniquelly filled' do
      before do
        state[0] = 'X'
        state[1] = 'X'
        state[2] = '2'
      end

      it 'returns true' do
        expect(subject).to be false
      end

      it 'does not set the row as first_uniquelly_filled_row' do
        subject
        expect(board.first_uniquelly_filled_row).to match_array([])
      end
    end
  end

  describe '.column_uniquelly_filled?' do
    subject { board.column_uniquelly_filled? }

    context 'when a given board column is uniquelly filled' do
      let(:column) { [state[0], state[3], state[6]] }

      before do
        state[0] = 'X'
        state[3] = 'X'
        state[6] = 'X'
      end

      it 'returns true' do
        expect(subject).to be true
      end

      it 'sets the column as first_uniquelly_filled_column' do
        subject
        expect(board.first_uniquelly_filled_column).to match_array(column)
      end
    end

    context 'when a given board column is  not uniquelly filled' do
      before do
        state[0] = 'X'
        state[3] = 'X'
        state[6] = '2'
      end

      it 'returns true' do
        expect(subject).to be false
      end

      it 'does not set the column as first_uniquelly_filled_column' do
        subject
        expect(board.first_uniquelly_filled_column).to match_array([])
      end
    end
  end

  describe '.diagonal_uniquelly_filled?' do
    subject { board.diagonal_uniquelly_filled? }

    context 'when the first board diagonal is uniquelly filled' do
      let(:first_diagonal) { [state[0], state[4], state[8]] }

      before do
        state[0] = 'X'
        state[4] = 'X'
        state[8] = 'X'
      end

      it 'returns true' do
        expect(subject).to be true
      end

      it 'set the first_diagonal as first_uniquelly_filled_diagonal' do
        subject
        expect(board.first_uniquelly_filled_diagonal).to match_array(first_diagonal)
      end
    end

    context 'when the first board diagonal is  not uniquelly filled' do
      let(:first_diagonal) { [state[0], state[4], state[8]] }

      before do
        state[0] = 'X'
        state[4] = 'X'
        state[8] = '2'
      end

      it 'returns false' do
        expect(subject).to be false
      end

      it 'does not set the first_diagonal as first_uniquelly_filled_diagonal' do
        subject
        expect(board.first_uniquelly_filled_diagonal).to match_array([])
      end
    end

    context 'when the secondary board diagonal is uniquelly filled' do
      let(:secondary_diagonal) { [state[2], state[4], state[6]] }

      before do
        state[2] = 'X'
        state[4] = 'X'
        state[6] = 'X'
      end

      it 'returns true' do
        expect(subject).to be true
      end

      it 'set the secondary_diagonal as first_uniquelly_filled_diagonal' do
        subject
        expect(board.first_uniquelly_filled_diagonal).to match_array(secondary_diagonal)
      end
    end

    context 'when the secondary board diagonal is not uniquelly filled' do
      let(:secondary_diagonal) { [state[2], state[4], state[6]] }

      before do
        state[2] = 'X'
        state[4] = 'X'
        state[6] = 'O'
      end

      it 'returns false' do
        expect(subject).to be false
      end

      it 'does not set the secondary_diagonal as first_uniquelly_filled_diagonal' do
        subject
        expect(board.first_uniquelly_filled_diagonal).to match_array([])
      end
    end
  end

  describe 'is_fully_filled?' do
    before do
      board.state = board_state
    end

    subject { board.is_fully_filled? }

    context 'when the board positions are all filled' do
      let(:board_state) { %w[X O O X O X O X X] }

      it { is_expected.to be(true) }
    end

    context 'when the board positions are not all filled' do
      let(:board_state) { %w[0 O O X O X 6 X X] }

      it { is_expected.to be(false) }
    end
  end

  describe 'is_central_dominance_spot_available?' do
    before do
      state[4] = central_dominance_spot_state
    end

    subject { board.is_central_dominance_spot_available? }

    context 'when central dominance spot is available' do
      let(:central_dominance_spot_state) { '4' }

      it 'returns true' do
        expect(subject).to be(true)
      end
    end

    context 'when central dominance spot is not available' do
      let(:central_dominance_spot_state) { 'X' }

      it 'returns true' do
        expect(subject).to be(false)
      end
    end
  end

  describe 'available_spots' do
    before do
      board.state = current_board_state
    end

    subject { board.available_spots }

    context 'when all board spots are available' do
      let(:current_board_state) { %w[0 1 2 3 4 5 6 7 8] }
      let(:expected_available_spots) { %w[0 1 2 3 4 5 6 7 8] }

      it 'returns true' do
        expect(subject).to match_array(expected_available_spots)
      end
    end

    context 'when only some board spots are available' do
      let(:current_board_state) { %w[0 X 2 O 4 5 6 O 8] }
      let(:expected_available_spots) { %w[0 2 4 5 6 8] }

      it 'returns true' do
        expect(subject).to match_array(expected_available_spots)
      end
    end

    context 'when no board spots are available' do
      let(:current_board_state) { %w[O X O X O O X O X] }
      let(:expected_available_spots) { [] }

      it 'returns true' do
        expect(subject).to match_array(expected_available_spots)
      end
    end
  end
end