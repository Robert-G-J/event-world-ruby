class World

	attr_accessor :grids

	def initialize
		 @grids  = [Grid.new.extend(GridRandom)]
	end

	def populate(populators)
		populators.each { |populator| 
			populator.prepare_world(self) 
		}
	end

end