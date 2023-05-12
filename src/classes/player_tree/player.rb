require_relative '../move'

class Player
  AVAILABLE_PLAYER_TYPES = {
    'HUMAN' => 'human',
    'COMPUTER' => 'computer',
  }

  AVAILABLE_PLAYER_MARKERS = {
    'HUMAN' => 'O',
    'COMPUTER' => 'X',
  }

  attr_reader :move_trials, :last_valid_move, :type, :marker

  def initialize
    @type = nil
    @marker = nil
    @move_trials = []
    @last_valid_move = nil
  end

  def try_move(board, input_position)
    move_trial =  Move.new(input_position, board)
    move_trials << move_trial

    if move_trial.valid
      @last_valid_move = move_trial
    end
  end

  def last_move_was_valid?
    !last_valid_move.nil? && last_valid_move == move_trials.last
  end
end