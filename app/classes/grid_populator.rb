# To randomly populate a grid with events
class GridPopulator

  def prepare_world(world)
  	world.grids.each { |grid|
  		prepare_grid(grid)
  	}
  end

  def prepare_grid(grid)
  	add_events(grid)
  end

  def add_events(grid)
  	grid.random_range_product.times do
  		grid.assign_to_coordinate(grid.random_x, grid.random_y, Event.create)
  	end
  end	

end