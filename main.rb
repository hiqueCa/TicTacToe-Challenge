require_relative './src/classes/game'

PLAY_AGAIN_MESSAGE = "\nDo you want to play again? (Y / N)"

playing = true

while playing
  Game.new.start

  puts PLAY_AGAIN_MESSAGE

  keep_playing = gets.chomp

  until (keep_playing == "Y" || keep_playing == "N")
    puts PLAY_AGAIN_MESSAGE

    keep_playing = gets.chomp
  end

  if keep_playing == "N"
    playing = false
  end
end