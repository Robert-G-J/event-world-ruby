# To randomly populate a grid with events
class GridPopulator

	attr_reader :events

  def prepare_world(world)
  		add_events(world.grid, world)
  end

  def prepare_grid(grid, world)
  	add_events(grid, world)
  end

 	def add_events(grid, world)
  	grid.random_range_product.times do
  		world.events.each do |event|
  			grid.assign_to_coordinate(grid.random_x, grid.random_y, event)
  		end
  	end
  end	

end