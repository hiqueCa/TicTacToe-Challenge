require_relative 'player'

class Human < Player

  def initialize(marker, name)
    super(marker, name)
    @type = Player::AVAILABLE_PLAYER_TYPES['HUMAN']
  end
end