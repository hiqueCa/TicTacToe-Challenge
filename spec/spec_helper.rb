require 'simplecov'
SimpleCov.start

require_relative '../requirements_helper'

RSpec.configure do |config|
  config.after(:suite) do
    SimpleCov.result.format!
  end
end