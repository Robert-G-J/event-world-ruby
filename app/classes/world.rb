class World

attr_reader :grids, :events, :tickets

	def populate(populators)
		populators.each { |populator| 
			populator.prepare_world(self) }
	end

end