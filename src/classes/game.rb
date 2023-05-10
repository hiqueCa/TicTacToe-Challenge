require_relative "./board"
require_relative "./player_tree/human"
require_relative "./player_tree/computer"
require 'pry'

class Game

  attr_reader :board

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

      eval_board

      puts board
    end

    puts 'Game over'
  end

  def eval_board
    spot = nil
    until spot
      if @board.state[4] == '4'
        spot = 4
        @board.state[spot] = @players[1].marker
      else
        spot = @players[1].define_best_move(self, @players[0])
        if @board.state[spot] != 'X' && @board.state[spot] != 'O'
          @board.state[spot] = @players[1].marker
        else
          break
        end
      end
    end
  end

  def has_a_winner?
    board.column_uniquelly_filled? || board.row_uniquelly_filled? || board.diagonal_uniquelly_filled?
  end

  def is_a_tie?
    board.is_fully_filled?
  end

  def is_over?
    (has_a_winner? || is_a_tie?)
  end
end
