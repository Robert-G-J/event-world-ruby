require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/event'
require_relative './models/ticket'
require_relative './models/coordinate'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/event_world_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
