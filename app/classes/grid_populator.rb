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

end