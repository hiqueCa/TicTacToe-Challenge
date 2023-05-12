class Move
  VALID_POSITIONS = %w[0 1 2 3 4 5 6 7 8]

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
    VALID_POSITIONS.include?(@position) && @board.valid_position?(position)
  end
end