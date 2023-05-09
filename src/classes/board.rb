class Board
  attr_accessor :state

  def initialize
    @state = %w[0 1 2 3 4 5 6 7 8]
  end

  def game_is_over
    [state[0], state[1], state[2]].uniq.length == 1 ||
    [state[3], state[4], state[5]].uniq.length == 1 ||
    [state[6], state[7], state[8]].uniq.length == 1 ||
    [state[0], state[3], state[6]].uniq.length == 1 ||
    [state[1], state[4], state[7]].uniq.length == 1 ||
    [state[2], state[5], state[8]].uniq.length == 1 ||
    [state[0], state[4], state[8]].uniq.length == 1 ||
    [state[2], state[4], state[6]].uniq.length == 1
  end

  def to_s
    "\s#{state[0]} | #{state[1]} | #{state[2]} \n===+===+===\n #{state[3]} | #{state[4]} | #{state[5]} \n===+===+===\n #{state[6]} | #{state[7]} | #{state[8]} \n"
  end

  def valid_board_position?(input_position)
    state[input_position.to_i] != 'X' && state[input_position.to_i] != 'O'
  end
end