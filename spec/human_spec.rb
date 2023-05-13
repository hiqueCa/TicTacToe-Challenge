require_relative 'spec_helper'

describe Human do
  let(:marker) { 'X' }
  let(:name) { 'bleus' }
  let(:human) { Human.new(marker, name) }

  describe '#new' do
    it 'creates an instance of Human with the correct attributes' do
      expect(human).to be_an_instance_of(Human)
      expect(human.type).to eq('human')
      expect(human.marker).to eq(marker)
      expect(human.name).to eq(name)
      expect(human.move_trials).to match_array([])
      expect(human.last_valid_move).to be_nil
    end

    it 'creates a Human instance which should inherit from Player superclass' do
      expect(described_class).to be < Player
    end
  end
end