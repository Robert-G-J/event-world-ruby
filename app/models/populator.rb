# To randomly populate a grid with events
require_relative 'grid'

class Populator

  attr_reader :grid

  def initialize
    @grid = Grid.new
  end

  def make_random_grid
    self.grid.generate_empty
    self.grid.assign_event(-1, 1, Event.new)
    self.grid.area
  end
end
