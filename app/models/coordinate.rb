class Coordinate

  attr_reader :x, :y, :position

  def initialize(x, y)
    @x = x
    @y = y
    @position = [x, y]
  end
end
