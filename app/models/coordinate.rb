# Coordinates have events. Events have tickets
class Coordinate

  # attributes
  # property :id, Serial
  # property :x, Integer
  # property :y, Integer

  attr_reader :x, :y, :position

  def initialize(x, y)
    @x = x
    @y = y
    @position = [x, y]
  end
end
