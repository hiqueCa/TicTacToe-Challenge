class Player
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
end