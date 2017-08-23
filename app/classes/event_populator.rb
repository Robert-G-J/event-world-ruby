class EventPopulator

	attr_reader :events

  def initialize
  	@events = []
  end

  def prepare_world(world)
  	create_events
  end

# The following two methods have tightly coupled code to allow instantaneous creation of events and tickets. It makes me uncomfortable...
  def create_events
  	rand(1..400).times do 
  		event = Event.new
  		self.events.push(event)
  	end
  	self.events.each do |event|
  		event.add_tickets(generate_tickets)
  	end
  end

  def generate_tickets
    tickets = []
  	rand(1...5000).times do 
  		ticket = Ticket.new(rand(20..50))
  		tickets << ticket
  	end
  	tickets
  end

end