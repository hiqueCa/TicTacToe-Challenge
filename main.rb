require_relative './src/classes/game'
require_relative './src/modules/validator'

include Validator

PLAY_AGAIN_INPUTS_PLAYING_MAPPER = {
  "Y" => true,
  "N" => false,
}

PLAY_AGAIN_MESSAGE = "\nDo you want to play again? (Y / N)"

INTRODUCTORY_DEFINE_GAME_TYPE_MESSAGE = "Hello! What kind of game would you want to play?: (CPU_CPU, HUMAN_HUMAN, HUMAN_CPU)"
RETRY_DEFINE_GAME_TYPE_MESSAGE = "Please, define a valid game type to play: (CPU_CPU, HUMAN_HUMAN, HUMAN_CPU)"

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