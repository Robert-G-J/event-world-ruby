# EventWorld app is modular Sinatra with a postgres database
ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'

require_relative 'server'

class EventWorld < Sinatra::Base
  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end
