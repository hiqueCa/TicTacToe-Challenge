require 'simplecov'
require 'pry'

SimpleCov.start

require_relative '../src/classes/player_tree/player'
require_relative '../src/classes/player_tree/human'
require_relative '../src/classes/player_tree/computer'
require_relative '../src/classes/move'
require_relative '../src/classes/board'
require_relative '../src/classes/game'

RSpec.configure do |config|
  config.after(:suite) do
    SimpleCov.result.format!
  end
end