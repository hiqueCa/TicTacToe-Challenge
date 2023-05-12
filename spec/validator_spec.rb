class DummyClass
  include Validator
end

describe Validator do
  let(:dummy_instance) { DummyClass.new }
  let(:validation_method) { :include? }

  subject { dummy_instance.validate?(**kwargs) }

  context 'when dealing with validation of play again inputs' do
    let(:play_again_valid_inputs) { described_class::VALID_PLAY_AGAIN_INPUTS }

    context 'when the input is valid' do
      let(:input) { 'Y' }
      let(:kwargs) do
        {
          values: input,
          compared_to: play_again_valid_inputs,
          by: validation_method,
        }
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when the input is invalid' do
      let(:input) { 'bleus' }
      let(:kwargs) do
        {
          values: input,
          compared_to: play_again_valid_inputs,
          by: validation_method,
        }
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end

  context 'when dealing with validation of game_types' do
    let(:game_types_valid_inputs) { described_class::VALID_GAME_TYPES }

    context 'when the input is valid' do
      let(:input) { 'CPU_CPU' }
      let(:kwargs) do
        {
          values: input,
          compared_to: game_types_valid_inputs,
          by: validation_method,
        }
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when the input is invalid' do
      let(:input) { 'bleus' }
      let(:kwargs) do
        {
          values: input,
          compared_to: game_types_valid_inputs,
          by: validation_method,
        }
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end

  context 'when dealing with validation of move positions' do
    let(:move_positions_valid_inputs) { described_class::VALID_POSITIONS }

    context 'when the input is valid' do
      let(:input) { '1' }
      let(:kwargs) do
        {
          values: input,
          compared_to: move_positions_valid_inputs,
          by: validation_method,
        }
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when the input is invalid' do
      let(:input) { 'bleus' }
      let(:kwargs) do
        {
          values: input,
          compared_to: move_positions_valid_inputs,
          by: validation_method,
        }
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when dealing with validation of markers' do
      let(:markers_valid_inputs) { described_class::VALID_MARKERS }
  
      context 'when the input is valid' do
        let(:input) { 'X' }
        let(:kwargs) do
          {
            values: input,
            compared_to: markers_valid_inputs,
            by: validation_method,
          }
        end
  
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
  
      context 'when the input is invalid' do
        let(:input) { 'bleus' }
        let(:kwargs) do
          {
            values: input,
            compared_to: markers_valid_inputs,
            by: validation_method,
          }
        end
  
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
    end
  end
end