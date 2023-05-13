require_relative '../move'

class Player
  AVAILABLE_PLAYER_TYPES = {
    'HUMAN' => 'human',
    'COMPUTER' => 'computer',
  }

  attr_reader :move_trials, :last_valid_move, :type, :marker, :name

  def initialize(marker, name)
    @type = nil
    @marker = marker
    @name = name
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

  def to_s
    @name
  end

  def place_marker(board)
    board.state[last_valid_move.valid_position] = marker
  end
end