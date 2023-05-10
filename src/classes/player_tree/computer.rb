require_relative 'player'

class Computer < Player

  def initialize
    super
    @type = Player::AVAILABLE_PLAYER_TYPES['COMPUTER']
    @marker = Player::AVAILABLE_PLAYER_MARKERS['COMPUTER']
  end
end