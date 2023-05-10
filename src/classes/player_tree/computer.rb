require_relative 'player'

class Computer < Player

  def initialize
    super
    @type = Player::AVAILABLE_PLAYER_TYPES['COMPUTER']
    @marker = Player::AVAILABLE_PLAYER_MARKERS['COMPUTER']
  end

  def define_best_move(game, next_player)
    best_move = nil

    available_spaces_for_current_try = game.board.state.map do |position|
      position if !%w[X O].include?(position)
    end.compact

    available_spaces_for_current_try.each do |available_space|
      game.board.state[available_space.to_i] = next_player.marker
      if game.has_a_winner?
        best_move = available_space.to_i
        game.board.state[available_space.to_i] = available_space

        return best_move
      else
        game.board.state[available_space.to_i] = available_space
      end
    end

    random_move_position = rand(0..available_spaces_for_current_try.count)
    available_spaces_for_current_try[random_move_position].to_i
  end
end