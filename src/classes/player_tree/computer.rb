require_relative 'player'

class Computer < Player

  def initialize
    super
    @type = Player::AVAILABLE_PLAYER_TYPES['COMPUTER']
    @marker = Player::AVAILABLE_PLAYER_MARKERS['COMPUTER']
  end

  def make_move(game, next_player)
    board = game.board

    if board.is_central_dominance_spot_available?
      input_position = 4
    else
      input_position = define_best_available_move(game, next_player)
    end

    try_move(board, input_position)
  end

  private

  def define_best_available_move(game, next_player)
    board = game.board
    available_spots_for_current_try = board.available_spots

    best_move = randomize_move_position_based_on(available_spots_for_current_try)

    available_spots_for_current_try.each do |available_spot|
      board.state[available_spot.to_i] = next_player.marker

      if game.has_a_winner?
        best_move = available_spot.to_i
      end

      board.state[available_spot.to_i] = available_spot
    end

    best_move
  end

  def randomize_move_position_based_on(available_spots)
    rand(0..available_spots.count)
  end
end