# An Event has a unique numeric id. Events have many tickets.
class Event
  include DataMapper::Resource

  property :id,   Serial

end
