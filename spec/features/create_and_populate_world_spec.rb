describe "Integration Test: Create and Populate World" do
	world = World.new
	grid_populator = GridPopulator.new
	event_populator = EventPopulator.new
	grid = Grid.new
	grid.extend(GridRandom)
	grid.generate_empty
	world.add_grid(grid)
	world.populate([event_populator, grid_populator])
	world.list_closest_events([1, 1])
end