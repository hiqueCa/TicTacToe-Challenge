require_relative './src/classes/game'

playing = true

while playing
  Game.new.start

  puts "Do you want to keep playing? (Y / N)"

  keep_playing = gets.chomp

  until (keep_playing == "Y" || keep_playing == "N")
    puts "Do you wnat to keep playing? (Y / N)"

    keep_playing = gets.chomp
  end

  if keep_playing == "N"
    playing = false
  end
end