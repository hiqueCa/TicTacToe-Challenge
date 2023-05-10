require_relative 'player'

class Human < Player

  def initialize
    super
    @marker = Player::AVAILABLE_PLAYER_MARKERS['HUMAN']
    @type = Player::AVAILABLE_PLAYER_TYPES['HUMAN']
  end
end