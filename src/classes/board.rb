class Board
  attr_accessor :state, :available_spots

  def initialize
    @state = %w[0 1 2 3 4 5 6 7 8]
  end

  def to_s
    "\s#{state[0]} | #{state[1]} | #{state[2]} \n===+===+===\n #{state[3]} | #{state[4]} | #{state[5]} \n===+===+===\n #{state[6]} | #{state[7]} | #{state[8]} \n"
  end

  def valid_position?(input_position)
    state[input_position.to_i] != 'X' && state[input_position.to_i] != 'O'
  end

  def row_uniquelly_filled?
    initial_row_indexes = [0, 3, 6]

    initial_row_indexes.each do |initial_row_index|
      row = [
        state[initial_row_index],
        state[initial_row_index + 1],
        state[initial_row_index + 2],
      ]

      if row.uniq.length == 1
        return true
      else
        next
      end
    end

    return false
  end

  def column_uniquelly_filled?
    initial_column_indexes = [0, 1, 2]

    initial_column_indexes.each do |initial_column_index|
      column = [
        state[initial_column_index],
        state[initial_column_index + 3],
        state[initial_column_index + 6],
      ]

      if column.uniq.length == 1
        return true
      else
        next
      end
    end

    return false
  end

  def diagonal_uniquelly_filled?
    common_diagonals_index = 4

    main_diagonal = [
      state[common_diagonals_index - 4],
      state[common_diagonals_index],
      state[common_diagonals_index + 4],
    ]

    secondary_diagonal = [
      state[common_diagonals_index - 2],
      state[common_diagonals_index],
      state[common_diagonals_index + 2],
    ]

    if main_diagonal.uniq.length == 1 || secondary_diagonal.uniq.length == 1
      return true
    end

    return false
  end

  def is_fully_filled?
    state.all? { |position| %w[X O].include?(position) }
  end

  def is_central_dominance_spot_available?
    state[4] == '4'
  end

  def available_spots
    state.map do |position|
      position if !%w[X O].include?(position)
    end.compact
  end
end