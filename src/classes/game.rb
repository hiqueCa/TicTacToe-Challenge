require_relative "./board"
require_relative "./player_tree/human"
require_relative "./player_tree/computer"
require 'pry'

class Game

  attr_reader :board, :player_one, :player_two

  def initialize
    @board = Board.new
    @players = [Human.new("X"), Computer.new("O")]
    @player_one = @players[0]
    @player_two = @players[1]
    @markers_to_players_mapper = {
      @player_one.marker.to_s => @player_one,
      @player_two.marker.to_s => @player_two,
    }
  end

  def start
    puts board

    until is_over?
      puts "Enter a move position between 0 and 8:"
      input_position = gets.chomp

      @player_one.try_move(board, input_position)

      until @player_one.last_move_was_valid?
        puts "Please, enter a valid move position:"
        input_position = gets.chomp

        @player_one.try_move(board, input_position)
      end

      @board.state[@player_one.last_valid_move.valid_position] = @player_one.marker

      @player_two.make_move(self, @player_one)
      @board.state[@player_two.last_valid_move.valid_position] = @player_two.marker

      puts board
    end

    print_end_game_message
  end

  def has_a_winner?
    board.column_uniquelly_filled? || board.row_uniquelly_filled? || board.diagonal_uniquelly_filled?
  end

  private

  def winner
    return @markers_to_players_mapper[board.first_uniquelly_filled_column_marker] if board.column_uniquelly_filled?
    return @markers_to_players_mapper[board.first_uniquelly_filled_row_marker] if board.row_uniquelly_filled?
    return @markers_to_players_mapper[board.first_uniquelly_filled_diagonal_marker] if board.diagonal_uniquelly_filled?
  end

  def print_end_game_message
    if (has_a_winner?)
      winner_type = winner.type

      puts "#{winner_type} has won!"
    elsif (is_a_tie?)
      puts "It is a tie!"
    end
  end

  def is_a_tie?
    board.is_fully_filled?
  end

  def is_over?
    (has_a_winner? || is_a_tie?)
  end
end
