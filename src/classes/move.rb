require_relative '../../requirements_helper'

class Move  
  
  include Validator

  attr_reader :position, :valid, :valid_position

  def initialize(position, board)
    @position = position
    @board = board
    @valid = valid? ? true : false
    @valid_position = valid? ? validated_position : nil
  end

  private
  
  def validated_position
    @position.to_i
  end

  def valid?
    validate?(
      values: position,
      compared_to: Validator::VALID_POSITIONS,
      by: :include?,
    ) && @board.valid_position?(@position)
  end
end