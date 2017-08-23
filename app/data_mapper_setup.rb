require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/event'
require_relative './models/ticket'
require_relative './models/coordinate'
require_relative './classes/grid'
require_relative './classes/grid_populator'
require_relative './classes/event_populator'
require_relative './classes/world'
require_relative './modules/random'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/event_world_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
