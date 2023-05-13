require_relative "../../requirements_helper"

class GameRunner
  include Validator
  include GameConstants::GameRunner

  def start
    puts INTRODUCTORY_DEFINE_GAME_TYPE_MESSAGE
    game_type = gets.chomp

    until game_type_input_valid(game_type)
      puts RETRY_DEFINE_GAME_TYPE_MESSAGE
      game_type = gets.chomp
    end

    playing = true

    while playing
      Game.new(game_type).start

      puts PLAY_AGAIN_MESSAGE

      keep_playing = gets.chomp

      until keep_playing_input_valid(keep_playing)
        puts PLAY_AGAIN_MESSAGE

        keep_playing = gets.chomp
      end

      playing = PLAY_AGAIN_INPUTS_PLAYING_MAPPER[keep_playing]
    end
  end

  private

  def game_type_input_valid(game_type)
    validate?(
      values: game_type,
      compared_to: Validator::VALID_GAME_TYPES,
      by: :include?,
    )
  end
  
  def keep_playing_input_valid(keep_playing)
    validate?(
      values: keep_playing,
      compared_to: Validator::VALID_PLAY_AGAIN_INPUTS,
      by: :include?,
    )
  end
end