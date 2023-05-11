require_relative 'player'

class Computer < Player

  def initialize
    super
    @type = Player::AVAILABLE_PLAYER_TYPES['COMPUTER']
    @marker = Player::AVAILABLE_PLAYER_MARKERS['COMPUTER']
  end

  def eval_board(game, next_player)
    board = game.board
    spot = nil

    until spot
      if board.is_central_dominance_spot_available?
        spot = 4
        board.state[spot] = marker
      else
        spot = define_best_available_move(game, next_player)
        board.state[spot] = marker
      end
    end
  end

  private

  def define_best_available_move(game, next_player)
    board = game.board
    best_move = nil
    available_spots_for_current_try = board.available_spots

    available_spots_for_current_try.each do |available_spot|
      board.state[available_spot.to_i] = next_player.marker

      if game.has_a_winner?
        best_move = available_spot.to_i
        board.state[available_spot.to_i] = available_spot

        return best_move
      else
        board.state[available_spot.to_i] = available_spot
      end
    end

    random_move_position = rand(0..available_spots_for_current_try.count)
    available_spots_for_current_try[random_move_position].to_i
  end
end