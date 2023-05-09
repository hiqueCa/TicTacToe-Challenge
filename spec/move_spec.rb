require_relative '../src/classes/move'
require_relative '../src/classes/board'

describe Move do
  describe '#new' do
    before do
      @board = Board.new()
      @move = Move.new(position, @board)
    end

    context 'when the user input position is valid' do
      let(:position) { '3' }

      it 'creates a new Move instance with the correct instance attributes' do
        expect(@move).to be_an_instance_of(Move)
        expect(@move.position).to eq(position)
        expect(@move.valid).to eq(true)
        expect(@move.valid_position).to eq(position.to_i)
      end
    end

    context 'when the user input position is invalid' do
      let(:position) { '/' }

      it 'creates a new Move instance with the correct instance attributes' do
        expect(@move).to be_an_instance_of(Move)
        expect(@move.position).to eq(position)
        expect(@move.valid).to eq(false)
        expect(@move.valid_position).to be_nil
      end
    end
  end
end