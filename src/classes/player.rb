require 'pry'
require_relative './move'

class Player
  VALID_POSITIONS = %w[0 1 2 3 4 5 6 7 8]

  AVAILABLE_PLAYER_TYPES = {
    'HUMAN' => 'human',
    'COMPUTER' => 'computer',
  }

  AVAILABLE_PLAYER_MARKERS = {
    'HUMAN' => 'O',
    'COMPUTER' => 'X',
  }

  attr_reader :type, :marker, :moves, :last_valid_move

  def initialize(type)
    @type = AVAILABLE_PLAYER_TYPES[type]
    @marker = AVAILABLE_PLAYER_MARKERS[type]
    @moves = []
    @last_valid_move = nil
  end

  def make_move(board, input_position)
    desired_position_input = input_position

    @moves << Move.new(desired_position_input)
    last_move = @moves.last

    if last_move.valid && board.valid_position?(last_move.valid_position)
      @last_valid_move = last_move
    end
  end
end