ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = EventWorld

RSpec.configure do |config|

  config.before(:suite) do
    # DatabaseCleaner.strategy = :transaction
    # DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
