require_relative 'spec_helper'

describe Computer do
  describe '#new' do
    let(:computer) { Computer.new }

    it 'creates an instance of Computer with the correct attributes' do
      expect(computer).to be_an_instance_of(Computer)
      expect(computer.type).to eq('computer')
      expect(computer.marker).to eq('X')
    end

    it 'creates a Computer instance which should inherit from Player superclass' do
      expect(described_class).to be < Player
    end
  end
end