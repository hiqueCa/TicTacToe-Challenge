require_relative "./board"
require_relative "./player_tree/human"
require_relative "./player_tree/computer"
require 'pry'

class Game

  attr_reader :board, :players

  def initialize
    @board = Board.new
    @players = [Human.new, Computer.new]
  end

  def start
    puts board

    until is_over?
      puts "Enter a move position between 0 and 8:"
      input_position = gets.chomp

      @players[0].try_move(board, input_position)

      until @players[0].last_move_was_valid?
        puts "Please, enter a valid move position:"
        input_position = gets.chomp

        @players[0].try_move(board, input_position)
      end

      @board.state[input_position.to_i] = @players[0].marker

      @players[1].make_move(self, @players[0])

      puts board
    end

    puts 'Game over'
  end

  def has_a_winner?
    board.column_uniquelly_filled? || board.row_uniquelly_filled? || board.diagonal_uniquelly_filled?
  end

  private

  def is_a_tie?
    board.is_fully_filled?
  end

  def is_over?
    (has_a_winner? || is_a_tie?)
  end
end
