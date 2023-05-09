class Game
  require_relative "./board"
  require_relative "./player"

  def initialize
    @board = Board.new
    @players = [Player.new('HUMAN'), Player.new('COMPUTER')]
  end

  def start_game
    # start by printing the board
    puts @board
    # loop through until the game was won or tied
    until @board.game_is_over || tie(@board.state)
      @players[0].play_human_move(@board)
      eval_board if !@board.game_is_over && !tie(@board.state)
      puts @board
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
        spot = get_best_move(@board, @players[1])
        if @board.state[spot] != 'X' && @board.state[spot] != 'O'
          @board.state[spot] = @players[1].marker
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, _next_player, _depth = 0, _best_score = {})
    available_spaces = []
    best_move = nil
    board.state.each do |s|
      available_spaces << s if s != 'X' && s != 'O'
    end
    available_spaces.each do |as|
      board.state[as.to_i] = @players[0].marker
      if board.game_is_over
        best_move = as.to_i
        board.state[as.to_i] = as
        return best_move
      else
        board.state[as.to_i] = @players[0].marker
        if board.game_is_over
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

  def tie(b)
    b.all? { |s| %w[X O].include?(s) }
  end
end
