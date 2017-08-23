class World

	attr_accessor :grids

	def initialize
		 @grids  = []
	end

	def populate(populators)
		populators.each { |populator| 
			populator.prepare_world(self) 
		}
	end

	def add_grids(grid)
		grids.push(grid)
	end

end