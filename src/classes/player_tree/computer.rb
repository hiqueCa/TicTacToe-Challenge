require_relative 'player'

class Computer < Player

  def initialize(marker, name)
    super(marker, name)
    @type = Player::AVAILABLE_PLAYER_TYPES['COMPUTER']
  end

  def make_move(game, next_player)
    board = game.board

    if board.is_central_dominance_spot_available?
      input_position = '4'
    else
      input_position = define_best_available_move(game, next_player)
    end

    try_move(board, input_position)
  end

  private

  def define_best_available_move(game, next_player)
    board = game.board
    available_spots_for_current_try = board.available_spots
    random_move_position = pick_random_position_among(available_spots_for_current_try)

    best_move = available_spots_for_current_try[random_move_position]

    available_spots_for_current_try.each do |available_spot|
      board.state[available_spot.to_i] = next_player.marker

      if game.has_a_winner?
        best_move = available_spot
      end

      board.state[available_spot.to_i] = available_spot
    end

    best_move
  end

  def pick_random_position_among(available_positions)
    rand(0...available_positions.count)
  end
end