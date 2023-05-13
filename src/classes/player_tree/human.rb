require_relative 'player'

class Human < Player

  def initialize(marker)
    super(marker)
    @type = Player::AVAILABLE_PLAYER_TYPES['HUMAN']
  end
end