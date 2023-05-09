class Player
  AVAILABLE_PLAYER_TYPES = {
    'human' => 'H',
    'computer' => 'C',
  }

  AVAILABLE_PLAYER_MARKERS = {
    'human' => 'O',
    'computer' => 'X',
  }

  attr_reader :type, :marker

  def initialize(type)
    @type = AVAILABLE_PLAYER_TYPES[type]
    @marker = AVAILABLE_PLAYER_MARKERS[type]
  end
end