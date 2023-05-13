require_relative "./board"
require_relative "./player_tree/human"
require_relative "./player_tree/computer"
require_relative "../modules/game_constants/game"

class Game

  include GameConstants::Game

  attr_reader :board, :player_one, :player_two

  def initialize(game_type)
    @board = Board.new
    @game_type = game_type.upcase
    @players = define_players
    @player_one = @players[0]
    @player_two = @players[1]
  end

  def start
    puts board

    until is_over?
      run_human_cpu_round if @game_type == 'HUMAN_CPU'
      run_human_human_round if @game_type == 'HUMAN_HUMAN'
      run_cpu_cpu_round if @game_type == 'CPU_CPU'
    end

    print_end_game_message
  end

  def has_a_winner?
    board.column_uniquelly_filled? || board.row_uniquelly_filled? || board.diagonal_uniquelly_filled?
  end

  private

  def winner
    return map_winning_marker_to_player(board.first_uniquelly_filled_column_marker) if board.column_uniquelly_filled?
    return map_winning_marker_to_player(board.first_uniquelly_filled_row_marker) if board.row_uniquelly_filled?
    return map_winning_marker_to_player(board.first_uniquelly_filled_diagonal_marker) if board.diagonal_uniquelly_filled?
  end

  def print_end_game_message
    if (has_a_winner?)
      puts "#{winner}#{HAS_WON_MESSAGE}"
    elsif (is_a_tie?)
      puts TIE_MESSAGE
    end
  end

  def is_a_tie?
    board.is_fully_filled?
  end

  def is_over?
    (has_a_winner? || is_a_tie?)
  end

  def run_human_cpu_round
    puts "#{player_one}#{REQUIRE_MOVEMENT_MESSAGE}"
    input_position = gets.chomp

    @player_one.try_move(board, input_position)

    until @player_one.last_move_was_valid?
      puts RETRY_INPUT_MESSAGE
      input_position = gets.chomp

      @player_one.try_move(board, input_position)
    end

    @board.state[@player_one.last_valid_move.valid_position] = @player_one.marker

    unless is_over?
      @player_two.make_move(self, @player_one)
      @board.state[@player_two.last_valid_move.valid_position] = @player_two.marker
    end

    puts board
  end

  def run_human_human_round
    puts "#{player_one}#{REQUIRE_MOVEMENT_MESSAGE}"
    player_one_input_position = gets.chomp

    @player_one.try_move(board, player_one_input_position)

    until @player_one.last_move_was_valid?
      puts RETRY_INPUT_MESSAGE
      player_one_input_position = gets.chomp

      @player_one.try_move(board, player_one_input_position)
    end

    @board.state[@player_one.last_valid_move.valid_position] = @player_one.marker
    puts board

    unless is_over?
      puts "#{player_two}#{REQUIRE_MOVEMENT_MESSAGE}"
      player_two_input_position = gets.chomp

      @player_two.try_move(board, player_two_input_position)
      
      until @player_two.last_move_was_valid?
        puts RETRY_INPUT_MESSAGE
        player_two_input_position = gets.chomp

        @player_two.try_move(board, player_two_input_position)
      end

      @board.state[@player_two.last_valid_move.valid_position] = @player_two.marker
      puts board
    end
  end

  def run_cpu_cpu_round
    puts "#{player_one}#{CPU_REQUIRE_MOVEMENT_MESSAGE}"
    @player_one.make_move(self, @player_two)
    @board.state[@player_one.last_valid_move.valid_position] = @player_one.marker

    puts board

    sleep(2)

    unless is_over?
      puts "#{player_two}#{CPU_REQUIRE_MOVEMENT_MESSAGE}"
      @player_two.make_move(self, @player_one)
      @board.state[@player_two.last_valid_move.valid_position] = @player_two.marker
      puts board
    end
  end

  def define_players
    case @game_type
    when "HUMAN_HUMAN"
      [Human.new('X', 'Human 1'), Human.new('O', 'Human 2')]
    when "HUMAN_CPU"
      [Human.new('X', 'Human 1'), Computer.new('O', 'Computer 1')]
    when "CPU_CPU"
      [Computer.new('X', 'Computer 1'), Computer.new('O', 'Computer 2')]
    end
  end

  def map_winning_marker_to_player(marker)
    {
      'X' => @player_one,
      'O' => @player_two,
    }[marker]
  end
end
