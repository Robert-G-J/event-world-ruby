class World

	attr_accessor :grid, :events, :populators

	def initialize
		 @grid = grid
		 @events = []
	end

	def populate(populators)
		populators.each { |populator| 
			populator.prepare_world(self) 
		}
	end

	def add_grid(grid)
		self.grid = grid
	end

	def list_closest_events(user_coords)
		event_data = []
			get_all_events.each_pair do |location, event|
				cheapest_ticket = get_cheapest_ticket(event.tickets)
				
				distance_from_user = self.grid.taxi_distance(user_coords, location)

				event_data.push([event, location, distance_from_user, cheapest_ticket])
			end
			
			 event_data.sort_by! { |array| array[2] }[0..4]
			 event_data.each do |event|
			 	puts "Event #{event[0]}, at #{event[1]}, Distance #{event[2]} units, Cheapest Ticket $#{event[3].price}"
			 end
					
	end

	def get_all_events
		events = {}
		self.grid.area.each_pair do |k, v|
			events[k] = v if v.is_a? Event
		end
		events
	end

	def get_cheapest_ticket(tickets)
		tickets.sort_by { |ticket| ticket.price }[0]
	end

end