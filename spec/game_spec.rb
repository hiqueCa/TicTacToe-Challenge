require_relative 'spec_helper'

describe Game do
  let(:game) { Game.new }

  describe '.has_a_winner?' do
    subject { game.has_a_winner? }

    context 'when the board has no column, row or diagonal uniquelly filled' do
      it { is_expected.to be(false) }
    end

    context 'when the board has a uniquelly filled column' do
      before do
        game.board.state = %w[X O O X O X X X O]
      end

      it { is_expected.to be(true) }
    end

    context 'when the board has a uniquelly filled row' do
      before do
        game.board.state = %w[X X X X O X O X O]
      end

      it { is_expected.to be(true) }
    end

    context 'when the board has a uniquelly filled diagonal' do
      before do
        game.board.state = %w[X O X O X O O O X]
      end

      it { is_expected.to be(true) }
    end
  end
end