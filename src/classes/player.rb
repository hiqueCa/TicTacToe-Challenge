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

  attr_reader :type, :marker

  def initialize(type)
    @type = AVAILABLE_PLAYER_TYPES[type]
    @marker = AVAILABLE_PLAYER_MARKERS[type]
    @moves = []
  end

  def play_human_move(board)
    puts "Enter a number between 0 and 8:"
    desired_position_input = gets.chomp

    @moves << Move.new(desired_position_input, board)
    last_move = @moves.last

    if last_move.valid
      board.state[last_move.validated_position] = marker
    else
      puts "Please, choose a valid position move between 0 and 8:"
      play_human_move(board)
    end
  end

  private

  def valid_position_input?(position_input)
    VALID_POSITIONS.include?(position_input)
  end
end