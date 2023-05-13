require_relative '../modules/validator'

class Board
  include Validator

  attr_accessor :state
  
  attr_reader :first_uniquelly_filled_column_marker,
              :first_uniquelly_filled_row_marker,
              :first_uniquelly_filled_diagonal_marker

  def initialize
    @state = %w[0 1 2 3 4 5 6 7 8]
    @first_uniquelly_filled_column_marker = nil
    @first_uniquelly_filled_row_marker = nil
    @first_uniquelly_filled_diagonal_marker = nil
  end

  def to_s
    "\s#{state[0]} | #{state[1]} | #{state[2]} \n===+===+===\n #{state[3]} | #{state[4]} | #{state[5]} \n===+===+===\n #{state[6]} | #{state[7]} | #{state[8]} \n"
  end

  def valid_position?(input_position)
    !validate?(
      values: state[input_position.to_i],
      compared_to: Validator::VALID_MARKERS,
      by: :include?,
    )
  end

  def row_uniquelly_filled?
    initial_row_indexes = [0, 3, 6]

    initial_row_indexes.each do |initial_row_index|
      row = [
        state[initial_row_index],
        state[initial_row_index + 1],
        state[initial_row_index + 2],
      ]

      row_uniq_markers = row.uniq

      if row_uniq_markers.length == 1
        @first_uniquelly_filled_row_marker = row_uniq_markers[0]
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

      column_uniq_markers = column.uniq

      if column_uniq_markers.length == 1
        @first_uniquelly_filled_column_marker = column_uniq_markers[0]
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

    main_diagonal_uniq_markers = main_diagonal.uniq
    secondary_diagonal_uniq_markers = secondary_diagonal.uniq

    if main_diagonal.uniq.length == 1
      @first_uniquelly_filled_diagonal_marker = main_diagonal_uniq_markers[0]
      return true
    elsif secondary_diagonal.uniq.length == 1
      @first_uniquelly_filled_diagonal_marker = secondary_diagonal_uniq_markers[0]
      return true
    end

    return false
  end

  def is_fully_filled?
    state.all? do |position|
      validate?(
        values: position,
        compared_to: Validator::VALID_MARKERS,
        by: :include?,
      )
    end
  end

  def is_central_dominance_spot_available?
    valid_position?('4')
  end

  def available_spots
    state.map do |position|
      position if !validate?(values: position, compared_to: Validator::VALID_MARKERS, by: :include?)
    end.compact
  end
end