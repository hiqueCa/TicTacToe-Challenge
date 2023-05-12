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

  attr_reader :moves, :last_valid_move, :type, :marker

  def initialize
    @type = nil
    @marker = nil
    @moves = []
    @last_valid_move = nil
  end

  def try_move(board, input_position)
    desired_position_input = input_position

    move =  Move.new(desired_position_input, board)

    if move.valid
      @moves << move
      @last_valid_move = @moves.last
    end
  end

  def last_move_was_valid?
    !last_valid_move.nil? && last_valid_move == moves.last
  end
end