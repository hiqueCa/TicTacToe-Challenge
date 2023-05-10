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

    until game_is_over?
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
        spot = get_best_move(@board)
        if @board.state[spot] != 'X' && @board.state[spot] != 'O'
          @board.state[spot] = @players[1].marker
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board)
    available_spaces = []
    best_move = nil
    board.state.each do |s|
      available_spaces << s if s != 'X' && s != 'O'
    end
    available_spaces.each do |as|
      board.state[as.to_i] = @players[0].marker
      if has_a_winner?
        best_move = as.to_i
        board.state[as.to_i] = as
        return best_move
      else
        board.state[as.to_i] = @players[0].marker
        if has_a_winner?
          best_move = as.to_i
          board.state[as.to_i] = as
          return best_move
        else
          board.state[as.to_i] = as
        end
      end
    end
    return best_move if best_move

    n = rand(0..available_spaces.count)
    available_spaces[n].to_i
  end

  def has_a_winner?
    board.column_uniquelly_filled? || board.row_uniquelly_filled? || board.diagonal_uniquelly_filled?
  end

  def is_a_tie?
    board.is_fully_filled?
  end

  def game_is_over?
    (has_a_winner? || is_a_tie?)
  end
end
