require 'pry'

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
  end

  def play_human_move(board)
    puts "Enter a number between 0 and 8:"
    desired_position_input = gets.chomp

    if valid_position_input?(desired_position_input) && board.valid_board_position?(desired_position_input)
      validated_board_position = desired_position_input.to_i
      board.state[validated_board_position] = marker
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