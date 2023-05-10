require_relative 'spec_helper'

describe Human do
  describe '#new' do
    let(:human) { Human.new }

    it 'creates an instance of Human with the correct attributes' do
      expect(human).to be_an_instance_of(Human)
      expect(human.type).to eq('human')
      expect(human.marker).to eq('O')
      expect(human.moves).to match_array([])
      expect(human.last_valid_move).to be_nil
    end

    it 'creates a Human instance which should inherit from Player superclass' do
      expect(described_class).to be < Player
    end
  end
end