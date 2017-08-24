# An Event has a unique numeric id. Events have many tickets.
class Event

  @@id = 1

  attr_reader :id, :tickets, :location

  def initialize
  	@tickets = []
  	@id = @@id
  	@@id += 1
  end

  def add_ticket(ticket)
  	@tickets << ticket
  end

  def add_tickets(array)
  	@tickets.concat array
  end

  private 
  attr_writer :tickets
end
