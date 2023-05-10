class Computer < Player

  def initialize
    @type = Player::AVAILABLE_PLAYER_TYPES['COMPUTER']
    @marker = Player::AVAILABLE_PLAYER_MARKERS['COMPUTER']
  end
end